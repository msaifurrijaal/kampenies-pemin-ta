import 'package:flutter/material.dart';
import 'package:kampenies/config/theme.dart';
import '../../data/models/mentor.dart';
import 'follow_button.dart';

class CardMentor extends StatelessWidget {
  const CardMentor({
    Key? key,
    required this.mentor,
  }) : super(key: key);
  final Mentor mentor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(0.5),
        width: 170,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: blueColor.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 0.1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 80,
                width: 80,
                child: Image.network(mentor.images),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mentor.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
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
              const SizedBox(height: 4),
              Text(
                mentor.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: greyColor),
              ),
              const SizedBox(height: 4),
              const FollowButton()
            ],
          ),
        ),
      ),
    );
  }
}
