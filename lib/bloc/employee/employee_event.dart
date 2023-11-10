part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

class GetEmployeeEvent extends EmployeeEvent {}
