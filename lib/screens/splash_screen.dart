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
        Get.toNamed(RouteName.pageHome);
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
          child: ListView(
        children: const [Center(child: Text('...loading pokoke'))],
      )),
    );
  }
}
