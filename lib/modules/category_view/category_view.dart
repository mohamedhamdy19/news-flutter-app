import 'package:flutter/material.dart';
import 'package:news_app/modules/news_list_view_buider/news_list_view_buider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Change this to the desired color
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [NewsListViewBuilder(category: category)],
          ),
        ));
  }
}
