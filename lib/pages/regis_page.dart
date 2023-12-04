// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kampenies/bloc/auth/auth_bloc.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/navbar.dart';

final formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = "/regis-page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  bool passToggle = false;
  bool confirmPassToggle = false;

  String gender = "";
  String division = "";
  String birthdayDate = "";

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        if (value != null) {
          birthdayDate = DateFormat('yyyy-MM-dd').format(value);
        }
      });
    });
  }

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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Nama",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: greyLightColor,
                        ),
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Silahkan isi nama anda';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
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
                        'Alamat',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Alamat",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: greyLightColor,
                        ),
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Silahkan isi alamat anda';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Nomor Telepon',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: phoneNumController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Nomor Telepon",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: greyLightColor,
                        ),
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Silahkan isi nomor telepon anda';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Tanggal Lahir',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: _showDatePicker,
                            child: Container(
                              alignment: Alignment.center,
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: lightBlueColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.calendar_today,
                                color: blueColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              enabled: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                hintText: birthdayDate,
                                hintStyle: TextStyle(color: blackColor),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  borderSide: BorderSide(color: softGreyColor),
                                ),
                                focusedBorder: InputBorder.none,
                                filled: true,
                                fillColor: greyLightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Divisi',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: [
                            Radio(
                              value: 'it',
                              groupValue: division,
                              onChanged: (value) {
                                setState(() {
                                  division = value.toString();
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text('Information Technology'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: [
                            Radio(
                              value: 'finance',
                              groupValue: division,
                              onChanged: (value) {
                                setState(() {
                                  division = value.toString();
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text('Finance'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Jenis Kelamin',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: [
                            Radio(
                              value: "M",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text('Laki-laki'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: Row(
                          children: [
                            Radio(
                              value: "F",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text('Perempuan'),
                          ],
                        ),
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
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is SignUpLoading) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 48),
                          ),
                        ),
                        onPressed: () {},
                        child: CircularProgressIndicator(
                          color: whiteColor,
                        ),
                      );
                    }
                    if (state is SignUpSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushReplacementNamed(
                            context, Navbar.routeName);
                      });
                    }
                    if (state is SignUpError) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      });
                      return ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 48),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  SignUpEvent(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    division: division,
                                    address: addressController.text,
                                    birthDate: birthdayDate,
                                    phoneNumber: phoneNumController.text,
                                    sex: gender,
                                  ),
                                );
                          }
                        },
                        child: Text(
                          'Daftar',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor),
                        ),
                      );
                    }

                    return ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 48),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                SignUpEvent(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  division: division,
                                  address: addressController.text,
                                  birthDate: birthdayDate,
                                  phoneNumber: phoneNumController.text,
                                  sex: gender,
                                ),
                              );
                        }
                      },
                      child: Text(
                        'Daftar',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, color: whiteColor),
                      ),
                    );
                  },
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
