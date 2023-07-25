import 'package:final_project/routes/route_name.dart';
import 'package:final_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isLoading;

  Future<dynamic> _login() async {
    try {
      var result = await AuthService().login("izyan@gmail.com", "izyan123");
      if (result['isSuccess']) {
        Get.snackbar(
          "Sukses",
          result['message'].toString(),
          backgroundColor: Colors.green[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
        Future.delayed(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.pageHome);
        });
      } else {
        Get.snackbar(
          "Error",
          result['message'].toString(),
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                _login();
              },
              child: Text('Login'))
        ],
      )),
    );
  }
}
