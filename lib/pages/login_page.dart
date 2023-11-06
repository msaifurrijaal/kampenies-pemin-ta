import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Masuk',
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(screenWidth * 0.05),
                hintText: "Email",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(screenWidth * 0.05),
                hintText: "Password",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Do something when the checkbox is checked or unchecked.
                    },
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
                Text(
                  'Ingat Saya',
                ),
                Text(
                  'Lupa password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
