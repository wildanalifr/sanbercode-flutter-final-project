import 'package:final_project/controller/news_controller.dart';
import 'package:final_project/routes/route_name.dart';
import 'package:final_project/widgets/card_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Obx(
                () => LoadingOverlay(
                  isLoading: _newsController.isLoading.value,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed('/page-detail-news',
                              arguments: _newsController.news[0]);
                        },
                        child:
                            Stack(alignment: Alignment.bottomLeft, children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 43, 43, 43),
                                  Color.fromARGB(54, 219, 216, 216),
                                  Color.fromARGB(48, 43, 43, 43),
                                  Color.fromARGB(255, 34, 34, 34)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0, 0, 0.6, 1],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: const Offset(
                                      0, 8), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                _newsController.isLoading.value
                                    ? "https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80"
                                    : _newsController.news[0].urlToImage == null
                                        ? "https://images.unsplash.com/photo-1607434472257-d9f8e57a643d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80"
                                        : _newsController.news[0].urlToImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '🔥 Hot News',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${_newsController.isLoading.value ? "...Loading" : _newsController.news[0].title}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 3, 3, 3),
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${_newsController.isLoading.value ? "...Loading" : _newsController.news[0].source.name}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 155, 155, 155),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Recommendation'),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          for (int i = 1; i < _newsController.news.length; i++)
                            CardNews(
                              id: i,
                              data: _newsController.news[i],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
