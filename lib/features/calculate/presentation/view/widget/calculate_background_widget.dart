import 'package:coinexa_app/conistant.dart';
import 'package:flutter/cupertino.dart';

class CalculateBackgroundWidget extends StatelessWidget {
  const CalculateBackgroundWidget({super.key});

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
              backgroundColorCalculate.withOpacity(0.99),
              backgroundColorCalculate.withOpacity(0.98),
              backgroundColorCalculate.withOpacity(0.97),
              backgroundColorCalculate.withOpacity(0.95),
              backgroundColorCalculate.withOpacity(0.94),
              backgroundColorCalculate.withOpacity(0.93),
              backgroundColorCalculate.withOpacity(0.92),
              backgroundColorCalculate.withOpacity(0.91),
              backgroundColorCalculate.withOpacity(0.9),
            ],
          ),
          color: backgroundColorCalculate,
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
