import 'package:coinexa_app/conistant.dart';
import 'package:flutter/cupertino.dart';

class BachgroundConvert extends StatelessWidget {
  const BachgroundConvert({super.key});

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
              secoundBackgroundColor.withOpacity(0.6),
              secoundBackgroundColor2.withOpacity(0.4),

              kPrimaryColors,
              kPrimaryColors,
              secoundBackgroundColor2,
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
