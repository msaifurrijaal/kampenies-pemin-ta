part of 'employee_bloc.dart';

abstract class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeSuccess extends EmployeeState {
  final List<Employee> employee;
  EmployeeSuccess({
    required this.employee,
  });
}
