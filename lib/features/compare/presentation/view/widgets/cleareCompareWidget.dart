// ignore_for_file: camel_case_types

import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/material.dart';

class clearIteamsButtom extends StatelessWidget {
  const clearIteamsButtom({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45,
      height: MediaQuery.sizeOf(context).height * 0.04,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          "Clear Compare",
          style: Style.TextStyle18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
