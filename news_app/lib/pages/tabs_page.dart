import 'package:flutter/material.dart';
import 'package:news_app/pages/tab1_page.dart';
import 'package:news_app/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "NewsApp",
            style: Theme.of(context).textTheme.headline5.copyWith(
                letterSpacing: 1.0, decoration: TextDecoration.underline),
          ),
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: _Pages(),
        bottomNavigationBar: _Navigationbar(),
      ),
    );
  }
}

class _Navigationbar extends StatefulWidget {
  @override
  __NavigationbarState createState() => __NavigationbarState();
}

class __NavigationbarState extends State<_Navigationbar> {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.indexPage,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text("Encabezados"))
      ],
      onTap: (i) {
        navigationModel.changePage(i);
        setState(() {});
      },
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[Tab1Page(), Tab2Page()],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _indexPage = 0;
  PageController _pageController = new PageController();

  int get indexPage => this._indexPage;
  PageController get pageController => this._pageController;

  void changePage(int index) {
    this._indexPage = index;

    this._pageController.animateToPage(index,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
