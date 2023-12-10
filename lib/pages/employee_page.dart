// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/auth/auth_bloc.dart';
import 'package:kampenies/bloc/employee/employee_bloc.dart';
import 'package:kampenies/bloc/user/user_bloc.dart';
import 'package:kampenies/kampenies__app_icons.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/card_employee.dart';
import 'package:kampenies/widgets/skeleton_widget.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent());
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
                      onChanged: (value) {
                        BlocProvider.of<EmployeeBloc>(context)
                            .add(SearchEmployee(query: value));
                      },
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
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const SkeletonEmployee();
                },
              );
            }
            if (state is UserSuccess) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return CardEmployee(
                    user: state.users[index],
                  );
                },
              );
            }
            if (state is UserError) {
              context.read<AuthBloc>().add(RefreshEvent());
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is RefreshLoading) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const SkeletonEmployee();
                      },
                    );
                  }
                  if (state is RefreshSuccess) {
                    context.read<UserBloc>().add(GetUserEvent());
                  }
                  if (state is RefreshError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                        ),
                      );
                    });
                    return const Center(
                      child: Text('No Data'),
                    );
                  }
                  return const Center(
                    child: Text('No Data'),
                  );
                },
              );
            }
            return const Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
    );
  }
}
