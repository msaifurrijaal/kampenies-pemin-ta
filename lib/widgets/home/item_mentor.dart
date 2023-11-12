import 'package:flutter/material.dart';
import 'package:kampenies/widgets/home/follow_button.dart';
import '../../models/mentor.dart';

class ItemMentor extends StatelessWidget {
  const ItemMentor({
    Key? key,
    required this.mentor,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);
  final Mentor mentor;

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 2,
        shadowColor: const Color(0xFF1570EF),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              width: screenHeight * 0.1,
              child: Image.network(mentor.images),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  mentor.name,
                  style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  Icons.verified_rounded,
                  color: Color(0xFF1570EF),
                  size: 20,
                )
              ],
            ),
            Text(
              mentor.category,
              style: TextStyle(
                color: const Color(0xFF98A2B3),
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
            const FollowButton()
          ]),
        ),
      ),
    );
  }
}
