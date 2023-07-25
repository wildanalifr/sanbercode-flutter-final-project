import 'package:final_project/services/news_service.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var news = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllNews();
    super.onInit();
  }

  getAllNews() async {
    try {
      isLoading.value = true;
      var result = await NewsService().getAllNews();
      if (result != null) {
        news.assignAll(result);
      } else {
        print('null');
      }
    } catch (e) {
      print('error $e');
    } finally {
      isLoading.value = false;
    }

    update();
  }
}
