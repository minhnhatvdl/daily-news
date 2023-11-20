import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class ArticlesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialArticlesState extends ArticlesState {}

class LoadingArticlesState extends ArticlesState {}

class LoadedArticlesState extends ArticlesState {
  LoadedArticlesState({required this.articles, this.isMax = false});
  final List<ArticleEntity> articles;
  final bool isMax;

  @override
  List<Object?> get props => [articles, isMax];
}

class ErrorArticlesState extends ArticlesState {
  ErrorArticlesState({required this.error});
  final DioException error;

  @override
  List<Object?> get props => [error];
}
