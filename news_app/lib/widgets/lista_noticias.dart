import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class ListNews extends StatefulWidget {
  List<Article> articles = [];

  ListNews(this.articles);

  @override
  _ListNewsState createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return (this.widget.articles.length == 0)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: ListView.builder(
            itemCount: this.widget.articles.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 25.0),
                child: Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          (widget.articles[i].author != null)
                              ? widget.articles[i].author
                              : "Anonimo",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(letterSpacing: 5.0),
                        ),
                        Text(
                          widget.articles[i].title,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 20.0, letterSpacing: 5.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            child: (widget.articles[i].urlToImage != null)
                                ? FadeInImage(
                                    image: NetworkImage(
                                        widget.articles[i].urlToImage),
                                    placeholder:
                                        AssetImage("assets/img/giphy.gif"),
                                  )
                                : AssetImage("assets/img/no-image.png")),
                        Text(
                          widget.articles[i].description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(letterSpacing: 2.0),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
  }

  @override
  bool get wantKeepAlive => true;
}
