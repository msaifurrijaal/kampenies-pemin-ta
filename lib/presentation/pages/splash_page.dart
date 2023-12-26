import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/config/theme.dart';

import '../bloc/auth/auth_bloc.dart';
import '../widgets/navbar.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(IsAuth());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, Navbar.routeName);
          });
        }
        if (state is AuthError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          });
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            color: blueColor,
            child: Center(
              child: Image.asset('images/logo_transparent.png'),
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          color: blueColor,
          child: Center(
            child: Image.asset('images/logo_transparent.png'),
          ),
        );
      },
    );
  }
}
