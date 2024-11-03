import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/category_view/category_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardBuidler extends StatelessWidget {
  final String title;
  final String path;
  const CardBuidler({super.key, required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: title);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 8, // How blurred the shadow is
              offset: const Offset(
                  0, 3), // Offset of the shadow (horizontal, vertical)
            ),
          ],
        ),
        width: 200,
        height: 100,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return WebViewer(url: articleModel.url ?? "https://www.google.com");
          },
        ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 3, // How much the shadow spreads
                blurRadius: 5, // How blurred the shadow is
                offset: const Offset(
                    0, 1), // Offset of the shadow (horizontal, vertical)
              ),
            ], borderRadius: BorderRadius.circular(12)),
            height: 210,
            width: double.infinity,
            child: Image.network(
              articleModel.image ??
                  "https://answers-afd.microsoft.com/static/images/image-not-found.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 8.0, left: 8.0, bottom: 3.0),
            child: Text(
              articleModel.title ?? "NO TITLE FOUND",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              articleModel.subtitle ?? "NO DESCRIPTION FOUND",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class WebViewer extends StatelessWidget {
  final WebViewController controller = WebViewController();
  final String url;

  WebViewer({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(url));
    return SafeArea(child: WebViewWidget(controller: controller));
  }
}
