import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/news_list_view/news_list_view.dart';
import 'package:news_app/services/get_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = GetService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(myarticles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
              child: Text("opps.. something went wrong!"));
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 11, 54, 89),
                color: Colors.white,
              )),
            ),
          );
        }
      },
    );
  }
}
