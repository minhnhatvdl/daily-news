import 'package:daily_news/features/daily_news/data/models/article_model.dart';
import 'package:hive/hive.dart';

class LocalArticlesService {
  Future<void> init() async => Hive.openBox<ArticleModel>('articles');

  Box<ArticleModel> getBox() => Hive.box<ArticleModel>('articles');

  Future<void> addArticles(List<ArticleModel> articles) {
    final box = getBox();
    return box.addAll(articles);
  }

  List<ArticleModel> getArticles() {
    final box = getBox();
    return box.values.toList();
  }

  Future<void> reset() {
    final box = getBox();
    return box.clear();
  }
}
