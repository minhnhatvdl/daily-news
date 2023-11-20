import 'package:daily_news/features/daily_news/data/models/article_model.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';

class ArticleMapper {
  static ArticleEntity mapTo(ArticleModel articleModel) {
    return ArticleEntity(
      author: articleModel.author,
      content: articleModel.content,
      description: articleModel.description,
      publishedAt: articleModel.author,
      title: articleModel.title,
      url: articleModel.url,
      urlToImage: articleModel.urlToImage,
    );
  }
}
