// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String namecoin;
  final double price;
  final String subtitle;
  final String imageUrl;
  final double rate;
  const FavoriteCard({
    super.key,
    required this.namecoin,
    required this.price,
    required this.subtitle,
    required this.rate, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 5),
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
        color: backgroundColorCalculate.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        color: secoundBackgroundColor.withOpacity(0.2),
        elevation: 10,
        shadowColor: secoundBackgroundColor.withOpacity(0.2),
        child: ListTile(
          title: Text(namecoin),
          subtitle: Text(subtitle),
          leading: Text("Image"),
          trailing: Column(children: [Text("$price"), Spacer(), Text("$rate")]),
        ),
      ),
    );
  }
}
