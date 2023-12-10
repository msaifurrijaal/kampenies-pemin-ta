part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUserEvent extends UserEvent {}

class SearchUserEvent extends UserEvent {
  final String query;

  SearchUserEvent({required this.query});
}
