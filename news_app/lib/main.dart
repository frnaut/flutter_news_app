import 'package:flutter/material.dart';
import 'package:news_app/helpers/categories.dart';
import 'package:news_app/pages/tabs_page.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/themes/dart_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => new NewsService(),
          ),
          ChangeNotifierProvider(
            create: (_) => Categories(),
          )
        ],
        child:
            MaterialApp(title: 'News App', theme: darkTheme, home: HomePage()));
  }
}
