import 'package:injectable/injectable.dart';
import 'package:news/core/Data/DataSource/article_data_source.dart';
import 'package:news/core/Data/models/Article%20Model/Article.dart';
import 'package:news/core/Source%20Repo/article_repo.dart';
@Injectable(as: ArticleRepo)
class ArticleRepoImpl extends ArticleRepo {
  ArticleDataSource articleSource ;
  @factoryMethod
  ArticleRepoImpl(this.articleSource);
  @override
  Future<List<Article>> getArticles(String category)async {
    var response = await articleSource.getArticles(category) ;
    return response;
  }

}