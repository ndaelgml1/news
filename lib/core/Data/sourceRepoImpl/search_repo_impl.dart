import 'package:injectable/injectable.dart';
import 'package:news/core/Data/models/Article%20Model/Article.dart';
import 'package:news/core/Source%20Repo/search_repo.dart';
import 'package:news/core/remote/network/api_manager.dart';
@Injectable(as: SearchRepo)
class SearchRepoImpl extends SearchRepo {
  SearchRepoImpl(this.apiManager) ;
  @factoryMethod
  ApiManager apiManager ;
  @override
  Future<List<Article>> searchArticles(String searchQuery)async {
     var data = await apiManager.getSearchedArticles(searchQuery: searchQuery) ;
   return data ?? [] ;
  }

}