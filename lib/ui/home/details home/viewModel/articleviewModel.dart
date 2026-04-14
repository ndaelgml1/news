import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/Source%20Repo/article_repo.dart';
import '../../../../core/Data/models/Article Model/Article.dart';
@injectable
class ArticleViewModel extends Cubit<ArticleState>{

  ArticleRepo articleRepo ;
  ArticleViewModel(this.articleRepo): super (LoadingState()) ;
   getArticles(String source) async{
     emit(LoadingState()) ;
     var articles =await articleRepo.getArticles(source);
     try{
       emit(SuccessState(articles??[])) ;

     }catch(e){
       emit(ErrorState(e.toString()));
     }
   }
 }


abstract class ArticleState {}

class LoadingState extends ArticleState {}
class ErrorState extends ArticleState {
  String errorMessage ;
  ErrorState(this.errorMessage);
}
class SuccessState extends ArticleState {
  List<Article> articles ;
  SuccessState(this.articles) ;
}