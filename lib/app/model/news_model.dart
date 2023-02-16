import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    required this.newsTitle,
    required this.publisherName,
    required this.imageUrl,
    required this.publisherImageUrl,
    required this.publisherRectangleUrl,
    required this.updated,
    required this.link,
  });

  String newsTitle;
  String publisherName;
  String imageUrl;
  String publisherImageUrl;
  String publisherRectangleUrl;
  String updated;
  String link;

  factory News.fromJson(Map<String, dynamic> json) => News(
        newsTitle: json["News Title"],
        publisherName: json["Publisher name"],
        imageUrl: json["Image url"],
        publisherImageUrl: json["Publisher image url"],
        publisherRectangleUrl: json["Publisher rectangle url"],
        updated: json["Updated"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "News Title": newsTitle,
        "Publisher name": publisherName,
        "Image url": imageUrl,
        "Publisher image url": publisherImageUrl,
        "Publisher rectangle url": publisherRectangleUrl,
        "Updated": updated,
        "Link": link,
      };
}
