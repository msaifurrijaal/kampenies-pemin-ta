import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/auth/auth_bloc.dart';
import 'package:kampenies/pages/login_page.dart';
import 'package:kampenies/pages/splash_page.dart';
import 'package:kampenies/widgets/navbar.dart';
import 'package:kampenies/pages/detail_employee_page.dart';
import 'package:kampenies/pages/regis_page.dart';
import 'package:kampenies/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        theme: lightTheme,
        routes: {
          RegisterPage.routeName: (context) => const RegisterPage(),
          DetailEmployeePage.routeName: (context) => const DetailEmployeePage(),
          Navbar.routeName: (context) => const Navbar(),
          LoginPage.routeName: (context) => const LoginPage(),
        },
      ),
    );
  }
}
