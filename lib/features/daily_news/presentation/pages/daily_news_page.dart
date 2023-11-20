import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_event.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_state.dart';
import 'package:daily_news/features/daily_news/presentation/widgets/list_articles.dart';
import 'package:daily_news/features/daily_news/presentation/widgets/loading_article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) => switch (state) {
          LoadingArticlesState() || InitialArticlesState() => ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (_, __) => const LoadingArticleItem(),
            ),
          LoadedArticlesState(articles: var articles, isMax: var isMax) when articles.isNotEmpty => ListArticles(
              articles: articles,
              isMax: isMax,
            ),
          LoadedArticlesState() => const Text('The daily news is empty'),
          ErrorArticlesState(error: var error) => Center(
              child: Column(
                children: [
                  Text(error.message ?? 'We have an error. Try to refresh the application'),
                  ElevatedButton(
                    onPressed: () => context.read<ArticlesBloc>().add(ResetArticlesEvent()),
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            )
        },
      ),
    );
  }
}
