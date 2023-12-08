import 'package:daily_news/features/daily_news/data/models/articles_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'articles_client.g.dart';

abstract class ArticlesClient {
  factory ArticlesClient(Dio dio, {required String baseUrl}) = _ArticlesClient;

  @GET('top-headlines')
  Future<HttpResponse<ArticlesModel>> getArticles({
    @Query('apiKey') String? apiKey,
    @Query('page') int? page,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
