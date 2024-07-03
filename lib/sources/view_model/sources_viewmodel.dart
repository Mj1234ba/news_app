import 'package:flutter/material.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repository/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository sourcesRepository;
  final SourcesDataSource sour=SourcesApiDataSource();
  SourcesViewModel() {
    sourcesRepository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessege;

  Future<void> getSource(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await sourcesRepository.getSources(categoryId);
    } catch (e) {
      errorMessege = e.toString();
    }
    isLoading = false;
    print('we are in false of notifyLisner');
    print('the sources is $sources');
    notifyListeners();
  }
}
