// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/lodaingWidget.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String namecoin;
  final double price;
  final String imageUrl;
  final double rate;
  const FavoriteCard({
    super.key,
    required this.namecoin,
    required this.price,
    required this.rate,
    required this.imageUrl,
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
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  SizedBox(width: 20, height: 20, child: Lodaingwidget()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
          ),
          trailing: Column(children: [Text("$price"), Spacer(), Text("$rate")]),
        ),
      ),
    );
  }
}
