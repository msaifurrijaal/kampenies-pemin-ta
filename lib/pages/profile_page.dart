// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kampenies/theme.dart';

class Profile_Page extends StatelessWidget {
  const Profile_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
                color: Color(0xFF0E64E6),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: Color(0xFF3E83EB),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('images/icon_shop.png'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Bisnis Saya',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/5.jpg"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(width: 6, color: whiteColor),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(90),
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Color(0xFF3E83EB),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Nama User',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Kampenies_App.ttf'),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'KOPPIE',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Kampenies_App.ttf'),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'agusraisa@mail.com',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFB7D0F7),
                          fontFamily: 'assets/fonts/Kampenies_App.ttf'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 12,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Akun dan Layanan',
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Kampenies_App.ttf',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.edit_document,
                                  color: Color(0xFF4B5565),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Ubah Data Akun',
                                  style: TextStyle(
                                      color: Color(0xFF4B5565), fontSize: 14),
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF4B5565),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: Color(0xFF4B5565),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Bahasa',
                                  style: TextStyle(
                                      color: Color(0xFF4B5565), fontSize: 14),
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF4B5565),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Color(0xFF4B5565),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Beri Rating',
                                  style: TextStyle(
                                      color: Color(0xFF4B5565), fontSize: 14),
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF4B5565),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.privacy_tip_outlined,
                                  color: Color(0xFF4B5565),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Kebijakan Privasi',
                                  style: TextStyle(
                                      color: Color(0xFF4B5565), fontSize: 14),
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF4B5565),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.help_outline,
                                  color: Color(0xFF4B5565),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Pusat Bantuan',
                                  style: TextStyle(
                                      color: Color(0xFF4B5565), fontSize: 14),
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF4B5565),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Color(0xFF4B5565),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Pengaturan',
                                  style: TextStyle(
                                      color: Color(0xFF4B5565), fontSize: 14),
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF4B5565),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Keluar',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFE3E8EF)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
