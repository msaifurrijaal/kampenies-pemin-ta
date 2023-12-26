// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        foregroundColor: isFollowing
            ? Colors.green
            : const Color(0xFF1570EF), // Ganti warna garis sesuai keadaan
        disabledForegroundColor: isFollowing
            ? Colors.green
            : const Color(0xFF1570EF), // Ganti warna teks sesuai keadaan
        side: BorderSide(
            width: 2.5,
            color: isFollowing
                ? Colors.green
                : const Color(0xFF1570EF)), // Ganti warna border sesuai keadaan
      ),
      onPressed: () {
        setState(() {
          isFollowing = !isFollowing; // Toggle keadaan
        });
      },
      child: Text(
        isFollowing ? "Diikuti" : "Ikuti", // Ganti label sesuai keadaan
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
    );
  }
}
