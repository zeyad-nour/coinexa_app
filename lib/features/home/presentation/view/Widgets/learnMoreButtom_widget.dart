import 'package:flutter/material.dart';

class LearnmorebuttomWidget extends StatelessWidget {
  const LearnmorebuttomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
      height: 40,
      width: 180,
      child: MaterialButton(onPressed: () {}, child: Text("Learn more")),
    );
  }
}
