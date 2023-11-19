// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kampenies/theme.dart';

final formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = "/regis-page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passToggle = false;
  bool confirmPassToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: blackColor,
          onPressed: () => Navigator.pop(context),
          highlightColor: transparentColor,
          splashColor: transparentColor,
        ),
        title: Center(
          child: Text(
            'Daftar',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.menu,
            color: transparentColor,
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Email",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: greyLightColor,
                        ),
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Silahkan isi email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
                            return 'Silahkan gunakan email yang benar';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kata Sandi',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !passToggle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Kata Sandi",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: greyLightColor,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(
                                passToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: greyColor),
                          ),
                        ),
                        validator: (password) =>
                            password!.isEmpty ? 'Silahkan isi password' : null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Konfirmasi Kata Sandi',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !confirmPassToggle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Konfirmasi Kata Sandi",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: greyLightColor,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                confirmPassToggle = !confirmPassToggle;
                              });
                            },
                            child: Icon(
                                confirmPassToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: greyColor),
                          ),
                        ),
                        validator: (password) => password!.isEmpty
                            ? 'Silahkan isi konfirmasi password'
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {
                            // Do something when the checkbox is checked or unchecked.
                          },
                          checkColor: whiteColor,
                          fillColor: MaterialStateProperty.all(blueColor),
                        ),
                        Text(
                          'Ingat Saya',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Text(
                      'Lupa password?',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: darkBlueColor),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(double.infinity, 48),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Gas login')),
                      );
                    }
                  },
                  child: Text(
                    'Daftar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500, color: whiteColor),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: blackColor),
                        height: 0.5,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      'atau daftar dengan',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: blackColor),
                        height: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/logo_google.png'),
                              SizedBox(width: 8),
                              Text(
                                "Google",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF3C5A9A),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/logo_fb.png'),
                              SizedBox(width: 8),
                              Text(
                                "Facebook",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: whiteColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                InkWell(
                  splashColor: transparentColor,
                  highlightColor: transparentColor,
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah mempunyai akun?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Masuk',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: darkBlueColor,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
