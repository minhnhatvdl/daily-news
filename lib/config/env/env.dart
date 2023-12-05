import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'NEWS_API_BASE_URL')
  static const String newsApiBaseUrl = _Env.newsApiBaseUrl;

  @EnviedField(varName: 'NEWS_API_KEY', obfuscate: true)
  static final String newsApiKey = _Env.newsApiKey;

  @EnviedField(varName: 'NEWS_COUNTRY_QUERY')
  static const String newsCountryQuery = _Env.newsCountryQuery;

  @EnviedField(varName: 'NEWS_CATEGORY_QUERY')
  static const String newsCategoryQuery = _Env.newsCategoryQuery;
}
