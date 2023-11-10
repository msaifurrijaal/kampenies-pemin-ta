import 'package:flutter/material.dart';
import 'package:kampenies/pages/home_page.dart';
import 'package:kampenies/pages/konsultasi_page.dart';
import 'package:kampenies/pages/media_page.dart';
import 'package:kampenies/pages/profile_page.dart';
import 'package:kampenies/app_icons.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  List pages = [
    const Home_Page(),
    const Konsultasi_Page(),
    const Media_Page(),
    const Profile_Page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22,
        elevation: 10,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Kampenies_App.icon_beranda), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Kampenies_App.icon_konsultasi), label: 'Konsultasi'),
          BottomNavigationBarItem(
              icon: Icon(Kampenies_App.icon_media), label: 'Media'),
          BottomNavigationBarItem(
              icon: Icon(Kampenies_App.icon_profile), label: 'Profile'),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF1570EF),
      ),
      body: pages[selectedIndex],
    );
  }
}
