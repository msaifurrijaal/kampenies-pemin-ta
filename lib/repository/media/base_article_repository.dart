import 'package:kampenies/data/models/article.dart';

abstract class BaseArticleRepository {
  Future<List<Article>> getArticle();
}
