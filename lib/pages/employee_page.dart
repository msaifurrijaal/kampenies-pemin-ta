// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/employee/employee_bloc.dart';
import 'package:kampenies/kampenies__app_icons.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/card_employee.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeBloc>().add(GetEmployeeEvent());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: blueColor,
          elevation: 1,
          backgroundColor: Colors.white,
          toolbarHeight: screenHeight * 0.2,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Karyawan",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const Icon(
                    Kampenies_Appp.list_bookmark,
                    color: blackColor,
                    size: 26,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchBar(
                      side: const MaterialStatePropertyAll(
                        BorderSide(color: lightBlueColor, width: 2),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(bgEditTextColor),
                      onChanged: (value) {},
                      textStyle: MaterialStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: greyColor,
                              )),
                      hintText: "Cari",
                      hintStyle: MaterialStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: greyColor,
                              )),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(45),
                          ), // Mengatur border radius menjadi 10
                        ),
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.search,
                          color: blackColor,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'images/icon_setting.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoading) {
              return Center(
                heightFactor: screenHeight * 0.3,
                child: const CircularProgressIndicator(),
              );
            }
            if (state is EmployeeSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.employee.length,
                itemBuilder: (context, index) {
                  return CardEmployee(
                    employee: state.employee[index],
                  );
                },
              );
            }
            return const Center(
              child: Text("NO DATA"),
            );
          },
        ),
      ),
    );
  }
}
