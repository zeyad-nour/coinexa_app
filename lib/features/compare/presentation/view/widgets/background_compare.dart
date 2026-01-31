// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BackgroundCompare extends StatelessWidget {
  const BackgroundCompare({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFB3E5FC).withOpacity(0.9),
              Color(0xFF81D4FA).withOpacity(0.8),
              Color(0xFF81D4FA).withOpacity(0.7),
              Color(0xFF81D4FA).withOpacity(0.6),
              Color(0xFF81D4FA).withOpacity(0.5),
              Color(0xFF81D4FA).withOpacity(0.4),
              Color(0xFF29B6F6).withOpacity(0.3),
              Color(0xFF29B6F6).withOpacity(0.4),
              Color(0xFF03A9F4).withOpacity(0.45),
              Color(0xFF03A9F4).withOpacity(0.456),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF81D4FA).withOpacity(0.25),
              blurRadius: 120,
              spreadRadius: 20,
              offset: Offset(0, 60),
            ),
          ],
        ),
      ),
    );
  }
}
