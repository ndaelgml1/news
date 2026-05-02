import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news/core/Data/models/Article%20Model/Article.dart';
import 'package:news/core/Data/models/SourcesResponse.dart';
import 'package:news/core/remote/network/constants.dart';

import '../../Data/models/Article Model/ArticleResponse.dart';

@singleton
class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=76c2a1438a45435bbcc201aee9d09508

  Future<SourcesResponse?> getSource(String category) async {
    try {
      Uri url = Uri.https(domain, "v2/top-headlines/sources", {
        "apiKey": apiKey,
        "category": category,
      });
      var response = await http.get(url);
      if (response.statusCode != 200) {
        print("HTTP Error: ${response.statusCode}");
        return null;
      }
      var json = jsonDecode(response.body);
      if (json["status"] != "ok") {
        print("API Error: ${json["message"]}");
        return null;
      }
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      print("error : $e");
      rethrow;
    }
  }

  Future<ArticlesResponse?> getArticles(String source) async {
    Uri url = Uri.https(domain, "/v2/everything", {
      "apiKey": apiKey,
      "sources": source,
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    if (json["status"] != "ok") {
      print("API Error: ${json["message"]}");
      return null;
    }
    var articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }

  Future<List<Article>?> getSearchedArticles({required String searchQuery,}) async {
    Uri url = Uri.https(domain, "v2/everything", {
      "apiKey": apiKey,
      "q": searchQuery,
    });
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    var data = ArticlesResponse.fromJson(jsonResponse);
    if (data.status == " ok" || response.statusCode == 200) {
      return data.articles;
    } else {
      throw data.message ?? "Some thing is wrong";
    }
  }
}
