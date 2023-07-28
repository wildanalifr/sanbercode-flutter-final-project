import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var index = RxInt(0);

  void change(int value) {
    index.value = value;
  }
}
