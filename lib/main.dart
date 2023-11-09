import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kampenies/navbar.dart';
=======
import 'package:kampenies/pages/login_page.dart';
import 'package:kampenies/pages/regis_page.dart';
>>>>>>> 7bd772659717d6d0cdb782b0dc53a632ee71290c

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      theme: ThemeData(fontFamily: 'Satoshi'),
      home: const Navbar(),
=======
      home: LoginPage(),
      routes: {
        RegisterPage.routeName: (context) => RegisterPage(),
      },
>>>>>>> 7bd772659717d6d0cdb782b0dc53a632ee71290c
    );
  }
}
