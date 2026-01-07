// ignore_for_file: unnecessary_import, deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/details/presentation/view/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewcoinsWidget extends StatelessWidget {
  final String imagecoin;
  final String title;
  final String subtitle;
  final double praic;
  final double rate;

  const ListviewcoinsWidget({
    super.key,
    required this.imagecoin,
    required this.title,
    required this.subtitle,
    required this.praic,
    required this.rate,
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
              MaterialPageRoute(builder: (_) => DetailsScreen()),
            );
          },
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imagecoin,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(Icons.error),
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
                    fontWeight: FontWeight.bold,
                    color: pTextColor,
                  ),
                ),
                Text(
                  "${rate.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: rate >= 0 ? Colors.green : Colors.red,
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
