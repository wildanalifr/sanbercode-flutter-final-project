import 'package:final_project/controller/bookmark_controller.dart';
import 'package:final_project/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CardNews extends StatefulWidget {
  CardNews({
    super.key,
    required this.id,
    required this.data,
  });

  final int? id;
  final dynamic data;

  @override
  State<CardNews> createState() => _CardNewsState();
}

class _CardNewsState extends State<CardNews> {
  final BookmarkController _bookmarkController = Get.put(BookmarkController());

  var dateFormatted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var now = widget.data.publishedAt;
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    dateFormatted = formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              '${widget.data.urlToImage == null ? "https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg" : widget.data.urlToImage}',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Text('${widget.data.title}',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dateFormatted),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('/page-detail-news',
                                  arguments: widget.data);
                            },
                            child: const Text('Read More'))
                      ],
                    ),
                    GetBuilder<BookmarkController>(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            if (_bookmarkController.isContain(widget.id!)) {
                              _bookmarkController.remove(
                                  {"id": widget.id, "data": widget.data});
                            } else {
                              _bookmarkController
                                  .add({"id": widget.id, "data": widget.data});
                            }
                          },
                          icon: Icon(
                            _bookmarkController.isContain(widget.id!)
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                          ));
                    })
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
