import 'package:daily_news/features/daily_news/data/models/article_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'articles_model.g.dart';

@JsonSerializable()
class ArticlesModel extends Equatable {
  const ArticlesModel({
    this.status,
    this.totalResults,
    this.articles,
  });
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => _$ArticlesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);

  @override
  List<Object?> get props => [status, totalResults, articles];
}
