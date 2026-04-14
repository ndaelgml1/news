import 'package:news/core/Data/models/Article%20Model/Article.dart';
import 'package:news/core/Data/models/SourcesResponse.dart';

abstract class ArticleDataSource {

  Future<List<Article>> getArticles(String category);
}