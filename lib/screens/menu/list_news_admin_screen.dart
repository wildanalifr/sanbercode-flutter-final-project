import 'package:final_project/controller/news_controller.dart';
import 'package:final_project/routes/route_name.dart';
import 'package:final_project/screens/crud/create_news_screen.dart';
import 'package:final_project/widgets/card_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ListNewsAdminScreen extends StatefulWidget {
  ListNewsAdminScreen({super.key});

  @override
  State<ListNewsAdminScreen> createState() => _ListNewsAdminScreenState();
}

class _ListNewsAdminScreenState extends State<ListNewsAdminScreen> {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => LoadingOverlay(
            isLoading: _newsController.isLoading.value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _newsController.news.length,
                  itemBuilder: (context, index) {
                    var item = _newsController.news[index];
                    print(_newsController.news.length);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? ElevatedButton(
                                onPressed: () {},
                                child: Text('+ Add New a News'))
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        CardNews(
                          id: index,
                          data: item,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            // ListView(
            //   children: [
            //       ElevatedButton(onPressed: () {}, child: Text('data')),
            //   ],
            // )
          ),
        ),
        // Text('data')
      ),
    );
  }
}
