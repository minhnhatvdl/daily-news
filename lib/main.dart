import 'dart:io';
import 'package:daily_news/features/daily_news/data/models/article_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:daily_news/config/router/app_router.dart';
import 'package:daily_news/config/theme/app_theme.dart';
import 'package:daily_news/features/daily_news/domain/usescases/articles_usecase.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_event.dart';
import 'package:daily_news/set_up_dependencies.dart';
import 'package:daily_news/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(ArticleModelAdapter());
  setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc(articlesUsecase: getIt<ArticlesUsecase>())..add(GetArticlesEvent()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        routerConfig: AppRouter.router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
      ),
    );
  }
}
