import 'package:kampenies/data/models/user.dart';

import '../data/models/article.dart';
import '../data/models/employee.dart';

class DataRepository {
  List<Article> _originalArticle = [];
  List<Employee> _originalEmployee = [];
  List<User> _originalUser = [];

  List<Article> get article => _originalArticle;

  List<Employee> get employee => _originalEmployee;

  List<User> get user => _originalUser;

  void setArticle(List<Article> data) {
    _originalArticle = data;
  }

  void setEmployee(List<Employee> data) {
    _originalEmployee = data;
  }

  void setUser(List<User> data) {
    _originalUser = data;
  }
}

final dataRepository = DataRepository();
