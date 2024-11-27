import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled19/model/sourceRespones.dart';

import 'NewsResponse.dart';
import 'api_constant.dart';

class ApiManger {
  static Future<SourceRespones> getSource(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sorceApi,
        {'apiKey': '0339124355e74cccaa7e4b655b4bfc2c',
          'category' : categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceRespones.fromJson(json);
    }
    catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse> getNewsBySourceID(String sourceID) async {
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.NewsApi,{
    'apiKey':'0339124355e74cccaa7e4b655b4bfc2c',
      'sources':sourceID
    });
    try{
      var respnse= await http.get(url);
      var bodyString= respnse.body;
      var jason= jsonDecode(bodyString);
      return NewsResponse.fromJson(jason);
    }catch(e){
      throw e;
    }
  }
}