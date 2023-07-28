class NewsModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? author;
  String? title;
  String? description;
  String? country;

  NewsModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.author,
    this.title,
    this.description,
    this.country,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "author": author,
        "title": title,
        "description": description,
        "country": country,
      };
}
