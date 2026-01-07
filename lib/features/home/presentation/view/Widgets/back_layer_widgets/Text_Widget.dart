// ignore_for_file: file_names

import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(197, 224, 117, 153),

            spreadRadius: 1,
            offset: Offset(10, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: Text("Home", style: Style.HomeTextStyle),
    );
  }
}
