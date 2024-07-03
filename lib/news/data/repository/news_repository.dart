import 'package:news_app/news/data/data_source/news_data_source.dart';

import '../models/news.dart';

class NewsRepository{
  final NewsDataSource dataSource;

  NewsRepository(this.dataSource);
  Future<List<News>>getNews (String sourceId)async{
     return  dataSource.getNews(sourceId);
  }

}