import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:kampenies/models/data_repository.dart';

part 'media_event.dart';
part 'media_state.dart';

const String baseUrl = "https://65518ed15c69a7790328e88a.mockapi.io/kampenies/";

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc() : super(ArticlesInitial()) {
    on<GetArticlesEvent>((event, emit) async {
      if (dataRepository.article.isEmpty) {
        emit(ArticlesLoading());

        try {
          var url = Uri.parse('${baseUrl}articles');
          final response = await http.get(
            url,
            headers: {
              "Content-Type": "application/json",
            },
          );

          if (response.statusCode >= 200 && response.statusCode < 300) {
            dataRepository.setArticle(artikelFromJson(response.body));
            emit(ArticlesSuccess(articles: dataRepository.article));
          } else {
            throw "Failed to load games. Status Code: ${response.statusCode}";
          }
        } catch (e) {
          emit(ArticleError(errorMessage: e.toString()));
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
