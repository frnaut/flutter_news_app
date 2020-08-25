import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return ListNews(newsService.articles);
  }
}
