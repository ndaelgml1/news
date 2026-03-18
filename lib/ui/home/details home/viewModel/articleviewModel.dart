import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/models/Article%20Model/Article.dart';
import 'package:news/core/remote/network/api_manager.dart';

class ArticleViewModel extends Cubit<ArticleState>{
  ArticleViewModel(): super (LoadingState()) ;
   getArticles(String article) async{
     var response =await ApiManager.getArticles(article);
     try{
       if(response.status=="error"){
         emit(ErrorState(response.message??""));
       }else{
         emit(SuccessState(response.articles??[])) ;
       }
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