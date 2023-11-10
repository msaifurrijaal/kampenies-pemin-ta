import 'package:flutter/material.dart';
import 'package:kampenies/widgets/home/item_widget.dart';

import '../../bloc/mentor/mentor_bloc.dart';

class List_Mentor extends StatelessWidget {
  const List_Mentor(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.state});

  final double screenHeight;
  final double screenWidth;
  final MentorSuccess state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 6, 0, 10),
      height: screenHeight * 0.3,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.02,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: state.mentors.length,
        itemBuilder: (context, index) {
          return Row(children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ItemMentor(
                mentor: state.mentors[index],
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
            ),
          ]);
        },
      ),
    );
  }
}
