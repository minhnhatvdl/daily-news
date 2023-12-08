import 'package:daily_news/core/resouces/response_state.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticlesRepository {
  Future<ResponseState<List<ArticleEntity>>> getArticles({required int page});
  List<ArticleEntity> getLocalArticles();
}
