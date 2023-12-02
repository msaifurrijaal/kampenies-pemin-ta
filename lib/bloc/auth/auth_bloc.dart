import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SingInEvent>((event, emit) async {
      emit(SignInLoading());
      try {
        var url = Uri.parse("https://pemin.aenzt.tech/api/v1/auth/login");

        var response = await http.post(
          url,
          body: json.encode({
            "email": event.email,
            "password": event.password,
          }),
        );

        var responseData = json.decode(response.body);
        print(responseData);
      } catch (error) {}
    });
  }
}
