import 'package:dio/dio.dart';
import 'package:final_project/config/dio_http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<dynamic> login(String email, String password) async {
    Map<String, dynamic>? result;
    try {
      final response = await DioHttp.request.post('/login', data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user-token', response.data['token']);
        prefs.setString('user', email);

        result = {"isSuccess": true, "message": "Berhasil login"};
      }
    } on DioException catch (e) {
      var message = "";
      if (e.response!.statusCode == 400) {
        message = e.response!.data["message"].toString();
      } else if (e.response!.statusCode == 404) {
        message = "Server not found";
      } else if (e.response!.statusCode == 401) {
        message = "Username/Password salah";
      }

      result = {"isSuccess": false, "message": message.toString()};
    }
    return result;
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    Map<String, dynamic>? result;

    try {
      final response = await DioHttp.request.post('/register', data: data);
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

  Future<dynamic> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user-token');

    Map<String, dynamic>? result;

    try {
      final response = await DioHttp.request.post('/logout',
          options: Options(headers: {"authorization": "Bearer $userToken"}));
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();

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
