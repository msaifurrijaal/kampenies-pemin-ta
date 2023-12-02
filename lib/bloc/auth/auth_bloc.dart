import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final String baseUrl = "https://pemin.aenzt.tech/api/v1/auth/";
  AuthBloc() : super(AuthInitial()) {
    on<IsAuth>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt('id');
      String? accessToken = prefs.getString('accessToken');
      String? refreshToken = prefs.getString('refreshToken');

      if (id != null && accessToken != null && refreshToken != null) {
        emit(AuthSuccess());
      }
    });

    on<SingInEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(SignInLoading());
      try {
        var url = Uri.parse("${baseUrl}login");

        var response = await http.post(
          url,
          body: json.encode({
            "email": event.email,
            "password": event.password,
          }),
          headers: {
            "Content-Type": "application/json",
          },
        );

        var responseData = json.decode(response.body);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          prefs.setInt('id', responseData['data']['id']);
          prefs.setString('accessToken', responseData['data']['access_token']);
          prefs.setString(
              'refreshToken', responseData['data']['refresh_token']);
          emit(SignInSuccess());
        } else {
          throw 'Failed Login : ${responseData['message']}';
        }
      } catch (error) {
        emit(SignInError(errorMessage: error.toString()));
      }
    });
  }
}
