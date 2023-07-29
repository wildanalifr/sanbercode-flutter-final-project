import 'package:final_project/routes/route_name.dart';
import 'package:final_project/screens/auth/login_screen.dart';
import 'package:final_project/screens/auth/register_screen.dart';
import 'package:final_project/screens/crud/create_news_screen.dart';
import 'package:final_project/screens/crud/detail_news_screen.dart';
import 'package:final_project/screens/main_screen.dart';
import 'package:final_project/screens/menu/bookmark_screen.dart';
import 'package:final_project/screens/menu/home_screen.dart';
import 'package:final_project/screens/menu/list_news_admin_screen.dart';
import 'package:final_project/screens/menu/profile_screen.dart';
import 'package:final_project/screens/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.pageSplash, page: () => const SplashScreen()),
    GetPage(name: RouteName.pageLogin, page: () => const LoginScreen()),
    GetPage(name: RouteName.pageRegister, page: () => RegisterScreen()),
    GetPage(name: RouteName.pageProfile, page: () => ProfileScreen()),
    GetPage(name: RouteName.pageMain, page: () => const MainScreen()),
    GetPage(name: RouteName.pageHome, page: () => const HomeScreen()),
    GetPage(name: RouteName.pageBookmark, page: () => BookMarkScreen()),
    GetPage(name: RouteName.pageDetailNews, page: () => DetailNewsScreen()),
    GetPage(
      name: RouteName.pageCreateNews,
      page: () => const CreateNewsScreen(),
    ),
    GetPage(
      name: RouteName.pageListNewsAdmin,
      page: () => ListNewsAdminScreen(),
    ),
  ];
}
