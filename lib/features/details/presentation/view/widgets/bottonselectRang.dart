// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:flutter/material.dart';

class BottonselectRang extends StatefulWidget {
  const BottonselectRang({super.key});

  @override
  State<BottonselectRang> createState() => _BottonselectrangState();
}

class _BottonselectrangState extends State<BottonselectRang> {
  TimeFrame selectedTimeFrame = TimeFrame.week; // الافتراضي: أسبوع

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        color: colorSelectIteamRange,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: TimeFrame.values.map((tf) {
          bool isSelected = tf == selectedTimeFrame;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTimeFrame = tf;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCirc,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? kPrimaryColorsTow : colorSelectIteamRange,
                borderRadius: BorderRadius.circular(50),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                timeFrameToString(tf),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.black : colorRate,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
