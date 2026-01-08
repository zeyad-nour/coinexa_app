// ignore: unused_import
import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class OptionsCardWidgets extends StatelessWidget {
  final String title;
  final String imagename;
  const OptionsCardWidgets({
    super.key,
    required this.title,
    required this.imagename,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: 30,
      decoration: BoxDecoration(
        color: kPrimaryColorsTow,

        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(36),
          right: Radius.circular(36),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: MediaQuery.sizeOf(context).width * 0.12,
            height: MediaQuery.sizeOf(context).height * 0.12,
            child: Image.asset(
              imagename,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

// kPrimaryColorsTow
