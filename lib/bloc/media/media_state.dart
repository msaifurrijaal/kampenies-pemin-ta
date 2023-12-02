part of 'media_bloc.dart';

abstract class MediaState {}

class ArticlesInitial extends MediaState {}

class ArticlesLoading extends MediaState {}

class ArticlesSuccess extends MediaState {
  final List<Artikel> articles;
  ArticlesSuccess({required this.articles});
}

class ArticleError extends MediaState {
  final String errorMessage;
  ArticleError({required this.errorMessage});
}
