// ignore_for_file: prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';

class LearnmorebuttomWidget extends StatelessWidget {
  LearnmorebuttomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(197, 221, 96, 138),

            spreadRadius: 1,
            offset: Offset(10, 10),
            blurRadius: 15,
          ),
        ],
        color: Colors.white,

        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
      height: 40,
      width: 180,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Learn more",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
        ),
      ),
    );
  }
}
