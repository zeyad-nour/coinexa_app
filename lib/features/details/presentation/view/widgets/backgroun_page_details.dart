// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgrounPageDetails extends StatelessWidget {
  const BackgrounPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              secoundBackgroundColor2.withOpacity(0.93),
              kPrimaryColors.withOpacity(0.933),
              kPrimaryColors.withOpacity(0.90),
              kPrimaryColors.withOpacity(0.69),
              secoundBackgroundColor2.withOpacity(0.99),
            ],
          ),

          boxShadow: [
            BoxShadow(
              color: secoundBackgroundColor.withOpacity(0.25),
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
