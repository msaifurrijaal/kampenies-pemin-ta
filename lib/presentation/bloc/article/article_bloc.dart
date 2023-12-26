import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kampenies/repository/media/article_repository.dart';

import '../../../data/models/article.dart';
import '../../../repository/data_repository.dart';

part 'article_event.dart';
part 'article_state.dart';

const String baseUrl = "https://65518ed15c69a7790328e88a.mockapi.io/kampenies/";

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;

  ArticleBloc(this._articleRepository) : super(ArticlesInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      if (dataRepository.article.isEmpty) {
        emit(ArticlesLoading());

        try {
          var articles = await _articleRepository.getArticle();
          dataRepository.setArticle(articles);
          emit(ArticlesSuccess(articles: dataRepository.article));
        } catch (error) {
          emit(ArticleError(errorMessage: error.toString()));
        }
      } else {
        emit(ArticlesSuccess(articles: dataRepository.article));
      }
    });

    on<SearchArticle>((event, emit) {
      List<Article> filteredArtikels = dataRepository.article
          .where((artikel) =>
              artikel.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ArticlesSuccess(articles: filteredArtikels));
    });
  }
}
