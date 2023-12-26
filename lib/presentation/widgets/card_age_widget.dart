import 'package:flutter/material.dart';
import 'package:kampenies/config/theme.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.gender,
  });

  final String gender;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          elevation: const MaterialStatePropertyAll(0),
          foregroundColor: const MaterialStatePropertyAll(blueColor),
          backgroundColor: const MaterialStatePropertyAll(Color(0xffEFF8FF))),
      onPressed: () {},
      icon: (gender == "M")
          ? const Icon(
              Icons.man,
              size: 20,
            )
          : const Icon(
              Icons.woman,
              size: 20,
            ),
      label: Text(
        gender,
        style:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: blueColor),
      ),
    );
  }
}
