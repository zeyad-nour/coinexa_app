import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class LeftIconWidget extends StatelessWidget {
  const LeftIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColorsTow,
        borderRadius: BorderRadius.circular(100),
      ),
      width: 56,
      height: 56,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.linear_scale_sharp, size: 27),
      ),
    );
  }
}
