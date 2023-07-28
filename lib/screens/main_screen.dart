import 'package:final_project/controller/bottom_nav_bar_controller.dart';
import 'package:final_project/screens/crud/create_news_screen.dart';
import 'package:final_project/screens/menu/bookmark_screen.dart';
import 'package:final_project/screens/menu/home_screen.dart';
import 'package:final_project/screens/menu/list_news_admin_screen.dart';
import 'package:final_project/widgets/bottom_navbar.dart';
import 'package:final_project/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    HomeScreen(),
    BookMarkScreen(),
    ListNewsAdminScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  BottomNavBarController bnbC = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      drawer: DrawerScreen(),
      body: PageStorage(
          bucket: bucket, child: Obx(() => screens[bnbC.index.value])),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
