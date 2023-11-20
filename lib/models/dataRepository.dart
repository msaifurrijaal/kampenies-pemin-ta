import 'articles.dart';

class DataRepository {
  List<Artikel> _original = [];

  List<Artikel> get original => _original;

  void setOriginal(List<Artikel> data) {
    _original = data;
  }
}

final dataRepository = DataRepository();
