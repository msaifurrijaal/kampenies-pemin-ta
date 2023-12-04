part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {
  final String errorMessage;

  SignUpError({required this.errorMessage});
}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInError extends AuthState {
  final String errorMessage;

  SignInError({required this.errorMessage});
}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {
  final String errorMessage;

  LogoutError({required this.errorMessage});
}

class RefreshLoading extends AuthState {}

class RefreshSuccess extends AuthState {}

class RefreshError extends AuthState {
  final String errorMessage;

  RefreshError({required this.errorMessage});
}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {}
