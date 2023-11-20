import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/models/articles.dart';
import 'package:http/http.dart' as http;

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc() : super(ArticlesInitial()) {
    List<Artikel> articles = [];
    on<GetArticlesEvent>((event, emit) async {
      if (articles.isEmpty) {
        emit(ArticlesLoading());
        final response = await http.get(
          Uri.parse(
              'https://65518ed15c69a7790328e88a.mockapi.io/kampenies/articles'),
          headers: {
            "Content-Type": "application/json",
          },
        );
        articles = artikelFromJson(response.body);
      }

      emit(ArticlesSuccess(articles: articles));
    });

    on<SearchArticle>((event, emit) {
      print("Searched Articles");
      emit(ArticlesLoading());
      if (state is ArticlesSuccess) {
        print("asdasda");
        List<Artikel> allArtikels = (state as ArticlesSuccess).articles;
        List<Artikel> filteredArtikels = allArtikels
            .where((artikel) =>
                artikel.title.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(ArticlesSuccess(articles: filteredArtikels));
      } else if (state is ArticlesInitial) {
        print("Initial");
      } else if (state is ArticlesLoading) {
        print("Loading");
      }
    });
  }
}
