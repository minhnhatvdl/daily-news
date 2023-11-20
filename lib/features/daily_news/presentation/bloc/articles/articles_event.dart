import 'package:equatable/equatable.dart';

sealed class ArticlesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetArticlesEvent extends ArticlesEvent {}

class ResetArticlesEvent extends ArticlesEvent {}
