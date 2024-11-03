import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class GetService {
  final Dio dio;
  GetService(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/everything?q=$category&apiKey=279797abd7ba400bb1806e159bb01ac4");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> myarticles = jsonData["articles"];

      List<ArticleModel> myarticleList = [];
      for (var article in myarticles) {
        var urlImage = article['urlToImage'];
        var title = article['title'];
        var url = article['url'];
        var subtitle = article['description'];
        if (url != null &&
            title != null &&
            urlImage != null &&
            subtitle != null) {
          myarticleList.add(ArticleModel(
              image: urlImage, title: title, subtitle: subtitle, url: url));
        }
      }
      return myarticleList;
    } on Exception {
      return [];
    }
  }
}
