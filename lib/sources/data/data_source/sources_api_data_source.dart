import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/models/sources_response.dart';

import '../../../shared/api_constant.dart';

class SourcesApiDataSource extends SourcesDataSource{

    @override
  Future<List<Source>> getSources(String categoryId) async {
     // try {
     final uri = Uri.https(
       ApiConstant.baseUrl,
       ApiConstant.sourcesEndPoint,
       {
         'apiKey': ApiConstant.apiKey,
         'category': categoryId,
       },
     );
     final respone = await http.get(uri);

     final json = jsonDecode(respone.body);
     final sourcesResponse= SourcesResponse.fromJson(json);
     if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
       return sourcesResponse.sources!;
     } else {
       throw Exception('Failed to get Sources!');
     }
     // } catch (e) {
     //   print('---------------------Errrorrr--------------------------');
     //   print(e);
     //   print('---------------------Errrorrr--------------------------');
/*
* same thing it just throw error to the widget we call the function
* for example to use showdialog coz it need context and here there is no context
* */
     // throw e;
// rethrow;
//     }
   }
 }