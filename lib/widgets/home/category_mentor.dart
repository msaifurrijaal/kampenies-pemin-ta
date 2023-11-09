import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Category_Mentor extends StatelessWidget {
  const Category_Mentor({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mentor dan Creator Kampenies',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: screenHeight * 0.021),
          ),
          Text.rich(TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("klik lihat semua");
                },
              text: 'Lihat Lainya',
              style: TextStyle(
                  color: const Color(0xFF1570EF),
                  fontSize: screenHeight * 0.02)))
        ],
      ),
    );
  }
}
