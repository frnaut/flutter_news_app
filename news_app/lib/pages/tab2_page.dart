import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:news_app/helpers/categories.dart';
// import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    NewsService _services = Provider.of<NewsService>(context);
    final categories = Provider.of<Categories>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _categories(categories, _services),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              categories.categoriaActual.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: 25.0),
            ),
          ),
          Container(height: 500.0, child: ListNews(_services.categories))
        ],
      ),
    );
  }

  Widget _categories(Categories categories, NewsService service) {
    // categories.addCategories();

    return Container(
        height: 60.0,
        child: ListView.builder(
            itemCount: categories.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) {
              return GestureDetector(
                onTap: () {
                  categories.changeCategory(categories.categories[i].name);
                  if (service.categories.length > 0) {
                    service.categories = [];
                  }
                  service.getCategories(categories.categories[i].name);
                  setState(() {});
                },
                child: Container(
                  height: 60.0,
                  width: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: (categories.categoriaActual ==
                                          categories.categories[i].name)
                                      ? Colors.redAccent[400]
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(100)),
                              width: 50.0,
                              height: 50.0,
                              child:
                                  Center(child: categories.categories[i].icon)),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
