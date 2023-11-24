import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:kampenies/models/dataRepository.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc() : super(ArticlesInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      if (dataRepository.article.isEmpty) {
        emit(ArticlesLoading());
        final response = await http.get(
          Uri.parse(
              'https://65518ed15c69a7790328e88a.mockapi.io/kampenies/articles'),
          headers: {
            "Content-Type": "application/json",
          },
        );
        dataRepository.setArticle(artikelFromJson(response.body));
      }

      emit(ArticlesSuccess(articles: dataRepository.article));
    });

    on<SearchArticle>((event, emit) {
      List<Artikel> filteredArtikels = dataRepository.article
          .where((artikel) =>
              artikel.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ArticlesSuccess(articles: filteredArtikels));
    });
  }
}
