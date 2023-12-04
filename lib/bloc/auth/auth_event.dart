part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String division;
  final String address;
  final String birthDate;
  final String phoneNumber;
  final String sex;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.division,
    required this.address,
    required this.birthDate,
    required this.phoneNumber,
    required this.sex,
  });
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class IsAuth extends AuthEvent {}

class RefreshEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
