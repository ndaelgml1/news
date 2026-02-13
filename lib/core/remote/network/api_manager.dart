import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/models/SourcesResponse.dart';
import 'package:news/core/remote/network/constants.dart';
class ApiManager {

//https://newsapi.org/v2/top-headlines/sources?apiKey=76c2a1438a45435bbcc201aee9d09508

  static Future<SourcesResponse ?  >getSource(String category)async{
    try{
      Uri url =Uri.https(
        domain,
        "v2/top-headlines/sources" ,
        {
          "apiKey" :apiKey,
          "category" : category ,
        }
    );
    var response = await http.get(url) ;
    var json = jsonDecode(response.body) ;
    var sourcesResponse =SourcesResponse.fromJson(json) ;
    return sourcesResponse ;
    }catch(e){
      return null ;
    }
}
}