import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../navbar.dart';

class Banner_Home extends StatelessWidget {
  const Banner_Home({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 6), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: const Color.fromARGB(255, 159, 193, 241))),
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'images/ilustration_banner.svg',
              height: screenHeight * 0.09,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Yuk, Mulai",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Navbar()));
                            },
                          text: " Kembangkan Diri",
                          style: const TextStyle(
                            color: Color(0xFF1570EF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: " !")
                      ]),
                ),
                const Text(
                  "Dapatkan Skor keaktifan",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_circle_right,
                  size: screenHeight * 0.045,
                  color: const Color(0xFF1570EF),
                ))
          ],
        ),
      ),
    );
  }
}
