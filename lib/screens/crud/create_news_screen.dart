import 'package:final_project/routes/route_name.dart';
import 'package:final_project/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  // Create variables to store the input values
  String title = '';
  String author = '';
  String description = '';
  String country = '';

  bool isLoading = false;

  Future<dynamic> _create() async {
    try {
      var result = await NewsService().createNews({
        "title": title,
        "author": author,
        "description": description,
        "country": country,
      });
      if (result['isSuccess']) {
        setState(() {
          isLoading = true;
        });
        Get.snackbar(
          "Sukses",
          "",
          backgroundColor: Colors.green[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
        Future.delayed(const Duration(seconds: 3), () {
          Get.toNamed(RouteName.pageMain);
          setState(() {
            isLoading = false;
          });
        });
      } else {
        Get.snackbar(
          "Error",
          result['message'].toString(),
          backgroundColor: Colors.red[300],
          icon: const Icon(Icons.error),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create News'),
      ),
      body: LoadingOverlay(
        isLoading: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Input fields for title, author, description, and country
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Author'),
                onChanged: (value) {
                  setState(() {
                    author = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLines: null,
                // expands: true,
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                onChanged: (value) {
                  setState(() {
                    country = value;
                  });
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _create();
                },
                child: Text('Create News'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
