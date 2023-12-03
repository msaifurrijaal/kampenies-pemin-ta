import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final String baseUrl = "https://pemin.aenzt.tech/api/v1";
  AuthBloc() : super(AuthInitial()) {
    on<IsAuth>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt('id');
      String? accessToken = prefs.getString('accessToken');
      String? refreshToken = prefs.getString('refreshToken');

      if (accessToken != null && refreshToken != null) {
        if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
          emit(AuthSuccess());
        } else {
          emit(AuthError());
        }
      } else {
        emit(AuthError());
      }
    });

    on<SingInEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(SignInLoading());
      try {
        var url = Uri.parse("$baseUrl/auth/login");

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

    on<LogoutEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken');
      String? refreshToken = prefs.getString('refreshToken');

      if (accessToken != null && refreshToken != null) {
        if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
          emit(LogoutLoading());
          try {
            var url = Uri.parse('$baseUrl/auth/logout');

            var response = await http.post(
              url,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $accessToken",
              },
            );

            var responseData = json.decode(response.body);

            if (response.statusCode >= 200 && response.statusCode < 300) {
              prefs.setInt('id', 0);
              prefs.setString('accessToken', '');
              prefs.setString('refreshToken', '');
              emit(LogoutSuccess());
            } else {
              throw 'Failed Login : ${responseData['message']}';
            }
          } catch (error) {
            emit(LogoutError(errorMessage: error.toString()));
          }
        }
      }
    });

    on<RefreshEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshToken');

      if (refreshToken != null) {
        if (refreshToken.isNotEmpty) {
          emit(RefreshLoading());
          try {
            var url = Uri.parse('$baseUrl/auth/refresh');

            var response = await http.post(
              url,
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $refreshToken",
              },
            );

            var responseData = json.decode(response.body);
            if (response.statusCode >= 200 && response.statusCode < 300) {
              prefs.setString(
                  'accessToken', responseData['data']['access_token']);
              prefs.setString(
                  'refreshToken', responseData['data']['refresh_token']);
              emit(RefreshSuccess());
            } else {
              throw 'Failed Login : ${responseData['message']}';
            }
          } catch (error) {
            emit(RefreshError(errorMessage: error.toString()));
          }
        }
      } else {
        emit(RefreshError(errorMessage: 'RefreshToken is empty'));
      }
    });
  }
}
