import 'package:daily_news/core/resouces/response_state.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:daily_news/features/daily_news/domain/repositories/articles_repository.dart';

class ArticlesUsecase {
  const ArticlesUsecase({required this.articlesRepository});
  final ArticlesRepository articlesRepository;

  Future<ResponseState<List<ArticleEntity>>> getArticles({required int page}) =>
      articlesRepository.getArticles(page: page);
}
