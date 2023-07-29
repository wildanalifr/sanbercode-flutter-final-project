import 'package:get/get.dart';

class BookmarkController extends GetxController {
  List bookmarks = [].obs;

  void add(item) {
    bookmarks.add(item);
    update();
    print("length bookmarks ${bookmarks.length}");
  }

  void remove(item) {
    bookmarks.removeWhere((items) => items['id'] == item['id']);
    update();
    print("length bookmarks ${bookmarks.length}");
  }

  bool isContain(int id) {
    return bookmarks.any((element) => element.values.contains(id));
  }
}
