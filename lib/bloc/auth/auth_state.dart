part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final String uid;
  final String accessToken;
  final String refreshToken;

  SignUpSuccess({
    required this.uid,
    required this.accessToken,
    required this.refreshToken,
  });
}

class SignUpError extends AuthState {
  final String errorMessage;

  SignUpError({required this.errorMessage});
}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final String uid;
  final String accessToken;
  final String refreshToken;

  SignInSuccess({
    required this.uid,
    required this.accessToken,
    required this.refreshToken,
  });
}

class SignInError extends AuthState {
  final String errorMessage;

  SignInError({required this.errorMessage});
}

class LogoutSuccess extends AuthState {}
