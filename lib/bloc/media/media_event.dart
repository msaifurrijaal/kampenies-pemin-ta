part of 'media_bloc.dart';

abstract class MediaEvent {}

class GetArticlesEvent extends MediaEvent {}

class SearchArticle extends MediaEvent {
  final String query;

  SearchArticle({
    required this.query,
  });
}
