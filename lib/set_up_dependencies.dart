import 'package:daily_news/config/env/env.dart';
import 'package:daily_news/features/daily_news/data/data_sources/local/local_articles_service.dart';
import 'package:daily_news/features/daily_news/data/data_sources/remote/articles_client.dart';
import 'package:daily_news/features/daily_news/data/repositories/articles_repository_impl.dart';
import 'package:daily_news/features/daily_news/domain/repositories/articles_repository.dart';
import 'package:daily_news/features/daily_news/domain/usescases/articles_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpDependencies() {
  // client
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ArticlesClient>(() => ArticlesClient(getIt<Dio>(), baseUrl: Env.newsApiBaseUrl));
  getIt.registerLazySingleton<LocalArticlesService>(() => LocalArticlesService()..init());

  // repository
  getIt.registerLazySingleton<ArticlesRepository>(() => ArticlesRepositoryImpl(
        articlesClient: getIt<ArticlesClient>(),
        localArticlesService: getIt<LocalArticlesService>(),
      ));

  // usecase
  getIt.registerLazySingleton<ArticlesUsecase>(() => ArticlesUsecase(articlesRepository: getIt<ArticlesRepository>()));
}
