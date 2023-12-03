import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/employee/employee_bloc.dart';
import 'package:kampenies/bloc/media/media_bloc.dart';
import 'package:kampenies/bloc/mentor/mentor_bloc.dart';
import 'package:kampenies/pages/employee_page.dart';
import 'package:kampenies/pages/home_page.dart';
import 'package:kampenies/pages/media_page.dart';
import 'package:kampenies/pages/profile_page.dart';
import 'package:kampenies/app_icons.dart';

import '../kampenies__app_icons.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  static const routeName = "/navbar-route";

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  List pages = [
    const HomePage(),
    const EmployeePage(),
    const Media_Page(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MentorBloc(),
        ),
        BlocProvider(
          create: (context) => EmployeeBloc(),
        ),
        BlocProvider(
          create: (context) => MediaBloc(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 18,
          selectedFontSize: 10,
          elevation: 10,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Kampenies_App.icon_beranda), label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Kampenies_App.icon_konsultasi), label: 'Karyawan'),
            BottomNavigationBarItem(
                icon: Icon(Kampenies_Appp.book), label: 'Media'),
            BottomNavigationBarItem(
                icon: Icon(Kampenies_App.icon_profile), label: 'Profile'),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF1570EF),
        ),
        body: pages[selectedIndex],
      ),
    );
  }
}
