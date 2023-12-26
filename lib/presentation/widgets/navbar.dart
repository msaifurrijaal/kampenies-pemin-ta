import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/presentation/bloc/article/article_bloc.dart';
import 'package:kampenies/repository/media/article_repository.dart';
import 'package:kampenies/repository/mentor/mentor_repository.dart';
import 'package:kampenies/repository/user/user_repository.dart';

import '../../util/app_icons.dart';
import '../../util/kampenies__app_icons.dart';
import '../bloc/mentor/mentor_bloc.dart';
import '../bloc/user/user_bloc.dart';
import '../pages/employee_page.dart';
import '../pages/home_page.dart';
import '../pages/media_page.dart';
import '../pages/profile_page.dart';

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
          create: (context) => MentorBloc(MentorRepository()),
        ),
        BlocProvider(
          create: (context) => UserBloc(UserRepository()),
        ),
        BlocProvider(
          create: (context) => ArticleBloc(ArticleRepository()),
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
