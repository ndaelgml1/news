import 'package:injectable/injectable.dart';
import 'package:news/core/Data/DataSource/article_data_source.dart';
import 'package:news/core/Data/models/Article%20Model/Article.dart';
import 'package:news/core/remote/network/api_manager.dart';
@Injectable(as: ArticleDataSource)
class ArticlesApiDataSourceImpl extends ArticleDataSource{
  ApiManager apiManager ;
  @factoryMethod
  ArticlesApiDataSourceImpl(this.apiManager) ;
  @override
  Future<List<Article>> getArticles(String source) async{
    var response = await apiManager.getArticles(source) ;
    return response?.articles?? [] ;
  }
}