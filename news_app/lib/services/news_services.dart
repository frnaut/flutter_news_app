import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  List<Article> articles = [];

  String _url = "http://newsapi.org/v2";
  String _apiKey = "b423dc14468c4cedbe2d5866e235c3cf";

  NewsService() {
    getAllArticles();
  }

  void getAllArticles() async {
    final String data =
        "everything?q=apple&from=2020-08-24&to=2020-08-24&sortBy=popularity&apiKey=";

    final resp = await http.get("$_url/$data$_apiKey");

    articles = newsModelFromJson(resp.body).articles;
    notifyListeners();
  }
}
