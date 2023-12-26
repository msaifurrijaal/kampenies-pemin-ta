part of 'article_bloc.dart';

abstract class ArticleState {}

class ArticlesInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesSuccess extends ArticleState {
  final List<Article> articles;
  ArticlesSuccess({required this.articles});
}

class ArticleError extends ArticleState {
  final String errorMessage;
  ArticleError({required this.errorMessage});
}
