import 'package:daily_news/core/resouces/response_state.dart';
import 'package:daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:daily_news/features/daily_news/domain/usescases/articles_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_event.dart';
import 'package:daily_news/features/daily_news/presentation/bloc/articles/articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc({required this.articlesUsecase}) : super(InitialArticlesState()) {
    on<GetArticlesEvent>((event, emit) async => _onGetArticles(event, emit, ++_page));
    on<ResetArticlesEvent>((event, emit) async {
      _page = 0;
      await _onGetArticles(event, emit, ++_page);
    });
  }
  final ArticlesUsecase articlesUsecase;
  int _page = 0;

  Future<void> _onGetArticles(ArticlesEvent event, Emitter<ArticlesState> emit, int page) async {
    if (page == 1) emit(LoadingArticlesState());
    final responseState = await articlesUsecase.getArticles(page: page);
    switch (responseState) {
      case SuccessfulResponse(data: List<ArticleEntity> articles):
        final allArticles = switch (state) {
          LoadedArticlesState(articles: var oldArticles) => [...oldArticles, ...articles],
          _ => articles,
        };
        emit(LoadedArticlesState(articles: allArticles, isMax: articles.isEmpty));
      case FailedResponse(error: var error):
        emit(ErrorArticlesState(error: error!));
    }
  }
}
