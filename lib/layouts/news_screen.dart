import 'package:flutter/material.dart';
import 'package:news_app/modules/card_list_view/card_list_view.dart';
import 'package:news_app/modules/news_list_view_buider/news_list_view_buider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "News ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 126, 150, 201),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                "Cloud☁️",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CardListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.0,
              ),
            ),
            NewsListViewBuilder(
              category: "general",
            ),
          ],
        ),
      ),
    );
  }
}
