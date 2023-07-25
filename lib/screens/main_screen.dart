import 'package:final_project/screens/menu/bookmark_screen.dart';
import 'package:final_project/screens/menu/home_screen.dart';
import 'package:final_project/screens/menu/list_news_admin_screen.dart';
import 'package:final_project/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const BookMarkScreen(),
    const ListNewsAdminScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
