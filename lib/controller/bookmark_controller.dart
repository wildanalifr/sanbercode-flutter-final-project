import 'package:get/get.dart';

class BookmarkController extends GetxController {
  List bookmarks = [].obs;

  void add(item) {
    bookmarks.add(item);
    print("length bookmarks ${bookmarks.length}");
    update();
  }

  void remove(item) {
    bookmarks.removeWhere((items) => items['id'] == item['id']);
    update();
  }

  bool isContain(int id) {
    return bookmarks.any((element) => element.values.contains(id));
  }
}
