// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:flutter/material.dart';

class BottonselectRang extends StatelessWidget {
  final TimeFrame selectedTimeFrame;
  final ValueChanged<TimeFrame> onChanged;

  const BottonselectRang({
    super.key,
    required this.selectedTimeFrame,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.073,
      width: MediaQuery.sizeOf(context).width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: colorSelectIteamRange,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: TimeFrame.values.map((tf) {
          final isSelected = tf == selectedTimeFrame;

          return GestureDetector(
            onTap: () => onChanged(tf),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? kPrimaryColorsTow : colorSelectIteamRange,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                timeFrameToString(tf),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
