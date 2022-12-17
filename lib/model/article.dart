import 'package:flutter/material.dart';

class Article {
  String title;
  String url;
  String urlToImage;
  Article({required this.title, required this.url, required this.urlToImage});
  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      url: map['url'],
      urlToImage: map['urlToImage'] ??
          'https://t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg',
    );
  }
}
