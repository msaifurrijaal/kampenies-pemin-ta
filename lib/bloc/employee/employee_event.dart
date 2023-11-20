part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

class GetEmployeeEvent extends EmployeeEvent {}

class SearchEmployee extends EmployeeEvent {
  final String query;

  SearchEmployee({required this.query});
}
