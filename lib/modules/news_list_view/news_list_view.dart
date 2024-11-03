import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/shared/components.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> myarticles;
  const NewsListView({super.key, required this.myarticles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 10),
              child: NewsBuilder(
                articleModel: myarticles[index],
              )),
          childCount: myarticles.length),
    );
  }
}
