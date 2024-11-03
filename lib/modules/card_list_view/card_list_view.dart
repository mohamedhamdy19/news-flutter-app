import 'package:flutter/material.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/shared/components.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CardBuidler(
            title: carditems[index].tite,
            path: carditems[index].backgroundimage),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: carditems.length,
      ),
    );
  }
}
