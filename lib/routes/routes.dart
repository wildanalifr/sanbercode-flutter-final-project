import 'package:final_project/routes/route_name.dart';
import 'package:final_project/screens/auth/login_screen.dart';
import 'package:final_project/screens/auth/register_screen.dart';
import 'package:final_project/screens/crud/create_news_screen.dart';
import 'package:final_project/screens/crud/update_news_screen.dart';
import 'package:final_project/screens/menu/bookmark_screen.dart';
import 'package:final_project/screens/menu/home_screen.dart';
import 'package:final_project/screens/menu/list_news_admin_screen.dart';
import 'package:final_project/screens/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteName.pageSplash, page: () => SplashScreen()),
    GetPage(name: RouteName.pageLogin, page: () => LoginScreen()),
    GetPage(name: RouteName.pageRegister, page: () => RegisterScreen()),
    GetPage(name: RouteName.pageHome, page: () => HomeScreen()),
    GetPage(name: RouteName.pageBookmark, page: () => BookMarkScreen()),
    GetPage(
        name: RouteName.pageListNewsAdmin, page: () => ListNewsAdminScreen()),
    GetPage(name: RouteName.pageCreateNews, page: () => CreateNewsScreen()),
    GetPage(
        name: RouteName.pageEditNews,
        page: () => UpdateNewsScreen(
              id: 0,
            )),
  ];
}
