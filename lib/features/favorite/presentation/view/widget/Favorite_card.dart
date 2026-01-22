// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 5),
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
        color: backgroundColorCalculate,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Card(
        color: secoundBackgroundColor.withOpacity(0.0009),
        elevation: 10,
        shadowColor: secoundBackgroundColor.withOpacity(0.39),
        child: ListTile(
          title: Text("title"),
          subtitle: Text("subtitle"),
          leading: Text("Image"),
          trailing: Column(children: [Text("price"), Spacer(), Text("Rate")]),
        ),
      ),
    );
  }
}
