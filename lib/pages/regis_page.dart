// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
  final TextEditingController ConfirmPasswordController =
      TextEditingController();
  bool passToggle = false;
  bool confirmPassToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        title: Center(
          child: Text(
            'Daftar',
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.transparent,
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
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: Color(0xFFEAECF0)),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF5FAFF),
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
                      const Text(
                        'Kata Sandi',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !passToggle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Kata Sandi",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: Color(0xFFEAECF0)),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF5FAFF),
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
                                color: Colors.grey),
                          ),
                        ),
                        validator: (password) =>
                            password!.isEmpty ? 'Silahkan isi password' : null,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Konfirmasi Kata Sandi',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: ConfirmPasswordController,
                        obscureText: !confirmPassToggle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Konfirmasi Kata Sandi",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: Color(0xFFEAECF0)),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFFF5FAFF),
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
                                color: Colors.grey),
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
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        const Text(
                          'Ingat Saya',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const Text(
                      'Lupa password?',
                      style: TextStyle(color: Color(0xFF194185), fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF1570EF),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 48)),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Gas login')),
                      );
                    }
                  },
                  child: Text('Daftar'),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black),
                        height: 0.5,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Text('atau daftar dengan'),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black),
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
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/logo_google.png'),
                              SizedBox(width: 8),
                              Text(
                                "Google",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah mempunyai akun?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Masuk',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1570EF)),
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
