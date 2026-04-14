import 'package:news/core/Data/models/Article%20Model/Article.dart';

abstract class ArticleRepo {
  Future<List<Article>> getArticles (String source);
}