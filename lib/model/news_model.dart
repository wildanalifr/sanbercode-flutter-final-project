import 'dart:convert';

List<NewsModel> NewsModelFromJson(String str) =>
    List<NewsModel>.from(jsonDecode(str).map((x) => NewsModel.fromJson(x)));

String NewsModelToJson(List<NewsModel> data) =>
    jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

class NewsModel {
  NewsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json['body']);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
