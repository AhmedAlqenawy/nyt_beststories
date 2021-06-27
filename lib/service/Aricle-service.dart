import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nyt_beststories/model/Article-model.dart';

class ArticlesApi{
  Future<List<Article>> fetchArticleList() async {
    try {
      var url = 'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9';
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData['status'] == "OK" ) {
        ListOfArticleModel sList = ListOfArticleModel.fromJson(extractedData);
        List<Article> articlesList=[];
        articlesList=sList.listofarticles.map((e) => Article.fromJson(e)).toList();
         return articlesList;
      }
      else {
        return [];
      }
    }
    catch (e) {
      print(e);
      return null;
    }
  }
}