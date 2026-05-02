import 'package:news/core/Data/models/Article%20Model/Article.dart';

abstract class SearchRepo {
  Future<List<Article>> searchArticles (String searchQuery) ;
}