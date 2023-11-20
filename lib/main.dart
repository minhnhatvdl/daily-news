import 'package:daily_news/config/router/app_router.dart';
import 'package:daily_news/config/theme/app_theme.dart';
import 'package:daily_news/features/daily_news/domain/usescases/articles_usecase.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_event.dart';
import 'package:daily_news/set_up_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ),
    );
  }
}
