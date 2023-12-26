import 'package:kampenies/data/models/mentor.dart';
import 'package:kampenies/repository/mentor/base_mentor_repository.dart';
import 'package:kampenies/util/constants.dart';
import 'package:http/http.dart' as http;

class MentorRepository implements BaseMentorRepository {
  @override
  Future<List<Mentor>> getMentors() async {
    var url = Uri.parse('${Constants.MOCK_URL}mentor');

    try {
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return mentorFromJson(response.body);
      } else {
        throw 'Failed to get mentors. Status code: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Failed to get users: $error';
    }
  }
}
