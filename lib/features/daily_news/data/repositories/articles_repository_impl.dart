import 'dart:io';
import 'package:daily_news/config/env/env.dart';
import 'package:daily_news/core/resouces/response_state.dart';
import 'package:daily_news/features/daily_news/data/data_sources/remote/articles_client.dart';
import 'package:daily_news/features/daily_news/data/mappers/article_mapper.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:daily_news/features/daily_news/domain/repositories/articles_repository.dart';
import 'package:dio/dio.dart';

class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesRepositoryImpl({required this.articlesClient});
  final ArticlesClient articlesClient;

  @override
  Future<ResponseState<List<ArticleEntity>>> getArticles({int page = 1}) async {
    try {
      final httpResponse = await articlesClient.getArticles(
        apiKey: Env.newsApiKey,
        page: page,
        country: Env.newsCountryQuery,
        category: Env.newsCategoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articlesModels = httpResponse.data.articles ?? [];
        final articlesEntities = articlesModels.map((e) => ArticleMapper.mapTo(e)).toList();
        return SuccessfulResponse(articlesEntities);
      }
      return FailedResponse(
        DioException(
          error: httpResponse.response.statusCode,
          message: httpResponse.response.statusMessage,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioException catch (e) {
      return FailedResponse(e);
    }
  }
}
