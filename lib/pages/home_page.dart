// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/employee/employee_bloc.dart';
import 'package:kampenies/bloc/mentor/mentor_bloc.dart';
import 'package:kampenies/widgets/home/banner.dart';
import 'package:kampenies/widgets/home/category_struktur_perusahaan.dart';
import '../widgets/home/category_mentor.dart';
import '../widgets/home/list_employee.dart';
import '../widgets/home/list_mentor.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: screenHeight * 0.08,
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [Image.asset('images/pp.png')],
              title: Text(
                "Hai, Agusleo!",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: screenHeight * 0.026),
              ),
            ),
            body: ListView(children: [
              Banner_Home(screenHeight: screenHeight),
              Category_Mentor(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              Container(
                height: screenHeight * 0.3,
                child: BlocBuilder<MentorBloc, MentorState>(
                  builder: (context, state) {
                    if (state is MentorLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is MentorSuccess) {
                      return List_Mentor(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        state: state,
                      );
                    }
                    return const Center(
                      child: Text('No Data'),
                    );
                  },
                ),
              ),
              Category_Struktur_Perusahaan(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  if (state is EmployeeLoading) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }
                  if (state is EmployeeSuccess) {
                    return List_Employee(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      state: state,
                    );
                  }
                  return const Center(
                    child: Text('No Data'),
                  );
                },
              ),
            ])));
  }
}
