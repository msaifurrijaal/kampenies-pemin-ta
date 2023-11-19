import 'package:flutter/material.dart';
import 'package:kampenies/theme.dart';

class AgeCard extends StatelessWidget {
  const AgeCard({
    super.key,
    required this.age,
  });

  final int age;

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
      icon: const Icon(
        Icons.cases_outlined,
        size: 20,
      ),
      label: Text(
        "$age Tahun",
        style:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: blueColor),
      ),
    );
  }
}
