import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailNewsScreen extends StatefulWidget {
  const DetailNewsScreen({super.key});

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  var data = Get.arguments;
  var dateFormatted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = data.publishedAt;
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    dateFormatted = formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            '${data.urlToImage == null ? "https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg" : data.urlToImage}',
            height: 300,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.white,
                  ))
            ],
          ),
          ListView(
            children: [
              SizedBox(
                height: 280,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(Icons.check)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(data.source.name),
                            ],
                          ),
                          Text(dateFormatted)
                          // Text(DateFormat.yMMMd().format(DateTime.now().toString())),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Author: ${data.author}",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        data.content == null ? "" : data.content,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
