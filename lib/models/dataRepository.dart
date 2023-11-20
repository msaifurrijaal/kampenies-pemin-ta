import 'package:kampenies/models/employee.dart';
import 'articles.dart';

class DataRepository {
  List<Artikel> _originalArticle = [];
  List<Employee> _originalEmployee = [];

  List<Artikel> get article => _originalArticle;

  List<Employee> get employee => _originalEmployee;

  void setArticle(List<Artikel> data) {
    _originalArticle = data;
  }

  void setEmployee(List<Employee> data) {
    _originalEmployee = data;
  }
}

final dataRepository = DataRepository();
