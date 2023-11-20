import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/widgets/loading_article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/articles/articles_event.dart';
import 'article_item.dart';

class ListArticles extends StatefulWidget {
  const ListArticles({required this.articles, this.isMax = false, super.key});
  final List<ArticleEntity> articles;
  final bool isMax;

  @override
  State<ListArticles> createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<ArticlesBloc>().add(GetArticlesEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<ArticlesBloc>().add(ResetArticlesEvent()),
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: widget.isMax ? widget.articles.length : widget.articles.length + 1,
        itemBuilder: (context, index) => index < widget.articles.length
            ? ArticleItem(
                articleEntity: widget.articles[index],
              )
            : const LoadingArticleItem(),
      ),
    );
  }
}
