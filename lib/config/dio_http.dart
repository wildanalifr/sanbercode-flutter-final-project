import 'package:dio/dio.dart';

class DioHttp {
  static String baseUrl = "https://demoapi-hilmy.sanbercloud.com/api";

  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    //kalau ada auth bearer token
  };

  static Dio request = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  ));
}
