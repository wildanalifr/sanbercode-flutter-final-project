import 'package:final_project/controller/bookmark_controller.dart';
import 'package:final_project/widgets/card_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarkScreen extends StatelessWidget {
  final BookmarkController _bookmarkController = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          // if there's listview or listView builder inside listview,
          // wrap listview with column add listview or listview builder with
          // shrinkWrap:true and just enough column [listview,listview]
          child: Obx(() => Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  if (_bookmarkController.bookmarks.isNotEmpty)
                    Expanded(
                      //selalu wrap listview builder dengan expanded
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _bookmarkController.bookmarks.length,
                        itemBuilder: (context, index) {
                          var item = _bookmarkController.bookmarks[index];
                          return Column(
                            children: [
                              CardNews(id: item['id'], data: item['data']),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                      ),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text(
                          'Tidak ada bookmark',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Silahkan menambahkan bookmark news untuk dibaca dikemudian waktu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.delete,
                          size: 100,
                        )
                      ],
                    )
                ],
              )),
        ),
      ),
    );
  }
}
