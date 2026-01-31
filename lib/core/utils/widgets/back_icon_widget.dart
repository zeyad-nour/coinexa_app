import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class BackIconWidget extends StatelessWidget {
  final Color color;
  const BackIconWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      width: 50,
      height: 50,

      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, size: 30),
      ),
    );
  }
}
