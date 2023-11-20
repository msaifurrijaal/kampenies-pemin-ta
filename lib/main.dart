import 'package:flutter/material.dart';
import 'package:kampenies/navbar.dart';
import 'package:kampenies/pages/detail_employee_page.dart';
import 'package:kampenies/pages/login_page.dart';
import 'package:kampenies/pages/regis_page.dart';
import 'package:kampenies/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Navbar(),
      theme: lightTheme,
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
        DetailEmployeePage.routeName: (context) => const DetailEmployeePage(),
      },
    );
  }
}
