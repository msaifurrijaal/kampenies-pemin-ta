import 'dart:convert';
import 'package:kampenies/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/user.dart';
import '../data_repository.dart';
import 'base_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository implements BaseUserRepository {
  @override
  Future<List<User>> getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    if (accessToken != null && accessToken.isNotEmpty) {
      try {
        var url = Uri.parse("${Constants.BASE_URL}employee");

        var response = await http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        );

        if (response.statusCode >= 200 && response.statusCode < 300) {
          var responseData = json.decode(response.body) as Map<String, dynamic>;
          dataRepository.setUser(userFromJson(responseData['data']));
          return dataRepository.user;
        } else {
          throw 'Failed get data : ${json.decode(response.body)['message']}';
        }
      } catch (error) {
        throw 'Failed to get users: $error';
      }
    } else {
      throw 'Access token is null or empty';
    }
  }
}
