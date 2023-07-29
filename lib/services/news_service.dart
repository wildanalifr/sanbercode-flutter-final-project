import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_project/config/dio_http.dart';
import 'package:final_project/model/new_news_model.dart';
import 'package:final_project/model/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class NewsService {
  Future<List<NewsNew>?> getAllNews() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=ar&apiKey=4ccd8485c2844d2da8a6c1d9bc7d67ca'));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body)['articles'];
        return jsonResponse.map((e) => NewsNew.fromJson(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      print('error $e');
    }

    // return result;
  }

  Future<dynamic> createNews(Map<String, dynamic> data) async {
    Map<String, dynamic>? result;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user-token');

    try {
      final response = await DioHttp.request.post('/news-created',
          data: data,
          options: Options(headers: {"authorization": "Bearer $userToken"}));
      if (response.statusCode == 200) {
        result = {"isSuccess": true};
      }
    } on DioException catch (e) {
      var message = "";
      if (e.response!.statusCode == 400) {
        message = e.response!.data["message"].toString();
      } else if (e.response!.statusCode == 404) {
        message = "Server not found";
      }
      result = {"isSuccess": false, "message": message.toString()};
    }
    return result;
  }

  Future<dynamic> deleteNews(int? id) async {
    Map<String, dynamic>? result;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user-token');

    try {
      final response = await DioHttp.request.delete('/news-remove/$id',
          options: Options(headers: {"authorization": "Bearer $userToken"}));
      if (response.statusCode == 200) {
        result = {"isSuccess": true};
      }
    } on DioException catch (e) {
      var message = "";
      if (e.response!.statusCode == 400) {
        message = e.response!.data["message"].toString();
      } else if (e.response!.statusCode == 404) {
        message = "Server not found";
      }
      result = {"isSuccess": false, "message": message.toString()};
    }
    return result;
  }
}
