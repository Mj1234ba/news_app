import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/news_response.dart';

import '../../../shared/api_constant.dart';
import '../models/news.dart';

class NewsApiDataSource extends NewsDataSource{
  @override
  Future<List<News>> getNews(String sourceId) async {
   // try {
      final uri = Uri.https(ApiConstant.baseUrl, ApiConstant.newsEndPotint,
          {'apiKey': ApiConstant.apiKey, 'sources': sourceId});
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final newsResponse= NewsResponse.fromJson(json);
      if(newsResponse.status=='ok'&& newsResponse.news!=null){
        return newsResponse.news!;
      }else{
        throw Exception('Failed get News');
      }
   // } catch (error) {
    //  print(error);
      //rethrow;
   // }
  }
}