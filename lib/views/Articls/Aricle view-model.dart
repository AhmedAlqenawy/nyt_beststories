import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt_beststories/model/Article-model.dart';
import 'package:nyt_beststories/service/Aricle-service.dart';

class ArticleProvider extends ChangeNotifier{
  static final articlesProvider = StateProvider<List<Article>>((ref) => []);
  fetchArticlesList(BuildContext context)async{
    context.read(articlesProvider).state=await ArticlesApi().fetchArticleList();
    notifyListeners();
  }
}