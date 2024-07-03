import '../data_source/sources_data_source.dart';
import '../models/source.dart';

class SourcesRepository {
  // final SourcesDataSource dataSource = SourcesApiDataSource();
  final SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) async {
    return  dataSource.getSources(categoryId);

    // final response = await apiDataSource.getSources(categoryId);
    // if (response.status == 'ok' && response.sources != null) {
    //   return response.sources!;
    // } else {
    //   throw Exception('Failed to get Sources!');
    // }
  }
}
