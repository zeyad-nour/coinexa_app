import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class TopiconWidet extends StatelessWidget {
  const TopiconWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bacgroundIconButtom,
        borderRadius: BorderRadius.circular(400),
      ),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.linear_scale_sharp)),
    );
  }
}
