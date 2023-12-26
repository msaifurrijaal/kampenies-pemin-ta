import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/presentation/bloc/auth/auth_bloc.dart';
import 'package:kampenies/presentation/pages/detail_employee_page.dart';
import 'package:kampenies/presentation/pages/login_page.dart';
import 'package:kampenies/presentation/pages/regis_page.dart';
import 'package:kampenies/presentation/pages/splash_page.dart';
import 'package:kampenies/presentation/widgets/navbar.dart';

import 'package:kampenies/config/theme.dart';

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
