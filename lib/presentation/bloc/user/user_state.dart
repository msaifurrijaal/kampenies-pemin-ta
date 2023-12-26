part of 'user_bloc.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;

  UserSuccess({required this.users});
}

class UserError extends UserState {
  final String errorMessage;

  UserError({required this.errorMessage});
}
