import 'package:flutter/material.dart';
import 'package:news_app/pages/tabs_page.dart';
import 'package:news_app/themes/dart_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'News App', theme: darkTheme, home: HomePage());
  }
}
