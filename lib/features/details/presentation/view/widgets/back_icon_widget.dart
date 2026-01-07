import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bacgroundIconButtom,
        borderRadius: BorderRadius.circular(100),
      ),
      width: 56,
      height: 56,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, size: 27),
      ),
    );
  }
}
