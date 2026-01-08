// ignore_for_file: unnecessary_import, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/lodaingWidget.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/details/presentation/view/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewcoinsWidget extends StatelessWidget {
  final String imagecoin;
  final String title;
  final String coinsID;
  final String subtitle;
  final double praic;
  final double rate;

  const ListviewcoinsWidget({
    super.key,
    required this.imagecoin,
    required this.title,
    required this.subtitle,
    required this.praic,
    required this.rate, required this.coinsID,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: kPrimaryColors,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    DetailsScreen(price: praic, rate: rate, headtitle: title,coinId: coinsID, imageUrl: imagecoin, name: title,),
              ),
            );
          },
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: imagecoin,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    SizedBox(width: 20, height: 20, child: Lodaingwidget()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
              ),
            ),
            title: Text(title, style: Style.TextStyle18.copyWith(fontSize: 18)),
            subtitle: Text(subtitle),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${praic.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: pTextColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${rate.toStringAsFixed(2)}%",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: rate >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
