import 'package:kampenies/data/models/article.dart';
import 'package:kampenies/repository/media/base_article_repository.dart';
import 'package:kampenies/util/constants.dart';
import 'package:http/http.dart' as http;

class ArticleRepository implements BaseArticleRepository {
  @override
  Future<List<Article>> getArticle() async {
    var url = Uri.parse('${Constants.MOCK_URL_2}articles');

    try {
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return artikelFromJson(response.body);
      } else {
        throw 'Failed to get mentors. Status code: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Failed to get users: $error';
    }
  }
}
