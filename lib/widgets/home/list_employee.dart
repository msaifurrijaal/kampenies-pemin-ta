import 'package:flutter/material.dart';
import 'package:kampenies/bloc/employee/employee_bloc.dart';
import 'package:kampenies/widgets/home/item_widget_employee.dart';

class List_Employee extends StatelessWidget {
  const List_Employee(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.state});

  final double screenHeight;
  final double screenWidth;
  final EmployeeSuccess state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: screenHeight * 0.015,
      ),
      shrinkWrap: true,
      itemCount: state.employee.length,
      itemBuilder: (context, index) {
        return ItemMentorr(
          employee: state.employee[index],
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        );
      },
    );
  }
}
