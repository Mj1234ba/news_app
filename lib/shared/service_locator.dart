import 'package:news_app/news/data/data_source/news_api_data_source.dart';
import 'package:news_app/news/data/models/source.dart';
import 'package:news_app/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';

import '../news/data/data_source/news_data_source.dart';

class ServiceLocator{
  static SourcesDataSource sourcesDataSource=SourcesApiDataSource();
  static NewsDataSource newsDataSource=NewsApiDataSource();
}