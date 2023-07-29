import 'package:final_project/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user-token');

    if (userToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed(RouteName.pageMain);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed(RouteName.pageLogin);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/21/21601.png',
                width: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
