part of 'article_bloc.dart';

abstract class ArticleEvent {}

class GetArticlesEvent extends ArticleEvent {}

class SearchArticle extends ArticleEvent {
  final String query;

  SearchArticle({
    required this.query,
  });
}
