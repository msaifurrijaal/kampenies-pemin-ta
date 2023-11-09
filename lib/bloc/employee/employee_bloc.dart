import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../models/employee.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<GetEmployeeEvent>((event, emit) async {
      emit(EmployeeLoading());
      final response = await http.get(
        Uri.parse(
            'https://654b7a515b38a59f28ef2618.mockapi.io/kampenies/employee'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      emit(EmployeeSuccess(employee: employeeFromJson(response.body)));
    });
  }
}
