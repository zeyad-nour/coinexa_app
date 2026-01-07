// ignore: unnecessary_import
import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/fron_layer_widgets/gridView_widgets.dart';
import 'package:flutter/material.dart';

class OutmostWidgets extends StatelessWidget {
  const OutmostWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.widthOf(context),
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: kPrimaryColors,
        border: Border.all(style: BorderStyle.none),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 150,

            spreadRadius: 0.001,
            offset: Offset(2, 25),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(child: GridviewWidgets()),
         
        ],
      ),
    );
  }
}
