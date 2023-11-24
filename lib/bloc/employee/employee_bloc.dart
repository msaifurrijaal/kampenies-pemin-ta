import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../models/data_repository.dart';
import '../../models/employee.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<GetEmployeeEvent>((event, emit) async {
      if (dataRepository.employee.isEmpty) {
        emit(EmployeeLoading());
        final response = await http.get(
          Uri.parse(
              'https://654b7a515b38a59f28ef2618.mockapi.io/kampenies/employee'),
          headers: {
            "Content-Type": "application/json",
          },
        );
        dataRepository.setEmployee(employeeFromJson(response.body));
      }
      emit(EmployeeSuccess(employee: dataRepository.employee));
    });

    on<SearchEmployee>(
      (event, emit) {
        List<Employee> filteredEmployee = dataRepository.employee
            .where((employee) =>
                employee.name
                    .toLowerCase()
                    .contains(event.query.toLowerCase()) ||
                employee.divisi
                    .toLowerCase()
                    .contains(event.query.toLowerCase()))
            .toList();
        emit(EmployeeSuccess(employee: filteredEmployee));
      },
    );
  }
}
