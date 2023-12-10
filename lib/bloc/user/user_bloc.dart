import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:kampenies/models/data_repository.dart';
import 'package:kampenies/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final String baseUrl = "https://pemin.aenzt.tech/api/v1";

  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken');

      if (dataRepository.user.isEmpty) {
        emit(UserLoading());
        if (accessToken != null) {
          if (accessToken.isNotEmpty) {
            try {
              var url = Uri.parse("$baseUrl/employee");

              var response = await http.get(
                url,
                headers: {
                  "Content-Type": "application/json",
                  "Authorization": "Bearer $accessToken",
                },
              );

              var responseData =
                  json.decode(response.body) as Map<String, dynamic>;

              if (response.statusCode >= 200 && response.statusCode < 300) {
                dataRepository.setUser(userFromJson(responseData['data']));
                emit(UserSuccess(users: dataRepository.user));
              } else {
                throw 'Failed get data : ${responseData['message']}';
              }
            } catch (error) {
              emit(UserError(errorMessage: error.toString()));
            }
          }
        }
      } else {
        emit(UserSuccess(users: dataRepository.user));
      }
    });

    on<SearchUserEvent>((event, emit) {
      List<User> filteredUser = dataRepository.user
          .where((user) =>
              user.name.toLowerCase().contains(event.query.toLowerCase()) ||
              user.division.name
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
          .toList();
      emit(UserSuccess(users: filteredUser));
    });
  }
}
