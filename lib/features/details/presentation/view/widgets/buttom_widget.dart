import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  //color button
  //collor text
  //text

  final Color colorbutton;
  final Color colortext;
  final String text;

  const ButtonWidget({
    super.key,
    required this.colorbutton,
    required this.colortext,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 55,
      decoration: BoxDecoration(
        color: colorbutton,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
          right: Radius.circular(50),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: Style.headTitle_TextStyle.copyWith(
            color: colortext,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// kPrimaryColorsTow
