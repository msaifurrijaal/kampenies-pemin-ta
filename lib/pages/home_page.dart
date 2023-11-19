// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kampenies/bloc/employee/employee_bloc.dart';
import 'package:kampenies/bloc/mentor/mentor_bloc.dart';
import 'package:kampenies/navbar.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/card_employee.dart';
import 'package:kampenies/widgets/card_mentor.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MentorBloc>().add(GetMentorEvent());
    context.read<EmployeeBloc>().add(GetEmployeeEvent());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hai, Agusleo',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Image.asset(
                        'images/pp.png',
                        height: 48,
                        width: 48,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: blueColor.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(
                              0,
                              6,
                            ), // changes position of shadow
                          ),
                        ],
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color.fromARGB(255, 159, 193, 241))),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'images/ilustration_banner.svg',
                          height: screenHeight * 0.09,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Yuk, Mulai",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w900),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Navbar()));
                                      },
                                    text: " Kembangkan Diri!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: blueColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Dapatkan Skor keaktifan",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_circle_right,
                            size: 36,
                            color: blueColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mentor dan Creator Kampenies',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      InkWell(
                        child: Text(
                          'Lihat lainnya',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: blueColor),
                        ),
                      ),
                    ],
                  ),
                ),
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
                        return Container(
                          height: screenHeight * 0.3,
                          child: ListView.separated(
                            padding: EdgeInsets.only(left: 20),
                            separatorBuilder: (context, index) => SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state.mentors.length,
                            itemBuilder: (context, index) {
                              return CardMentor(
                                mentor: state.mentors[index],
                              );
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: Text('No Data'),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Struktur Perusahaan',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      InkWell(
                        child: Text(
                          'Lihat lainnya',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: blueColor),
                        ),
                      ),
                    ],
                  ),
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
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
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
                      child: Text('No Data'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
