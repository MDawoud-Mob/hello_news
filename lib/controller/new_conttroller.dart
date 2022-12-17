import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/article.dart';

class NewsController extends GetxController {
  var currentInd = 0.obs;
  Future<List<Article>> getGeneral(String cat) async {
    var url =
        'https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=51390b6e20f442858afddcd3d80787b8';
    var JsonDatas = await http.get(Uri.parse(url));

    if (JsonDatas.statusCode == 200) {
      var datas = json.decode(JsonDatas.body);
      List<Article> allUsers = [];
      for (var x in datas['articles']) {
        Article article = Article.fromMap(x);
        allUsers.add(article);
      }
      return allUsers;
    } else {
      throw Exception('error');
    }
  }
}
