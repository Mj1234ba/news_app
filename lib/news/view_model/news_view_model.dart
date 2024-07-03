import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_api_data_source.dart';
import 'package:news_app/news/data/repository/news_repository.dart';
import 'package:news_app/shared/service_locator.dart';

import '../data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  // final NewsApiDataSource apiDataSource = NewsApiDataSource();
  late final NewsRepository repository;

  NewsViewModel() {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }

  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      newsList = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
