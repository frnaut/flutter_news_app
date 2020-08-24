import 'package:flutter/material.dart';
import 'package:news_app/pages/tab1_page.dart';
import 'package:news_app/pages/tab2_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _Pages(),
      ),
      bottomNavigationBar: _Navigationbar(),
    );
  }
}

class _Navigationbar extends StatefulWidget {
  @override
  __NavigationbarState createState() => __NavigationbarState();
}

class __NavigationbarState extends State<_Navigationbar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text("Encabezados"))
      ],
      onTap: (i) {
        index = i;
        setState(() {});
      },
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[Tab1Page(), Tab2Page()],
    );
  }
}
