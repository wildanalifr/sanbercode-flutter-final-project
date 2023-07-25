import 'dart:convert' as convert;

import 'package:final_project/config/dio_http.dart';
import 'package:final_project/model/news_model.dart';

class NewsService {
  Future<List<NewsModel>?> getAllNews() async {
    List<NewsModel>? result;
    try {
      final response = await DioHttp.request.get('/news-all');

      if (response.statusCode == 200) {
        List jsonResponse = convert.jsonDecode(response.data.body);
        result = jsonResponse.map((e) => NewsModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      print('error $e');
    }

    return result;
  }
}
