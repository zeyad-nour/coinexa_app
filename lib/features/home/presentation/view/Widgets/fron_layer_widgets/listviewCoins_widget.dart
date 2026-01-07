// ignore_for_file: unnecessary_import

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewcoinsWidget extends StatelessWidget {
  final String imagecoin;
  final String title;
  final String subtitle;
  final double praic;
  final double rate;
  final int lenght;

  const ListviewcoinsWidget({
    super.key,
    required this.imagecoin,
    required this.title,
    required this.subtitle,
    required this.praic,
    required this.rate,
    required this.lenght,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),

      itemCount: lenght,
      itemBuilder: (context, index) {
        return Card(
          color: kPrimaryColors,
          elevation: 0,

          child: ListTile(
            leading: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: kPrimaryColors,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(imagecoin),
            ),
            title: Text(title, style: Style.TextStyle18.copyWith(fontSize: 20)),
            subtitle: Text(subtitle),
            trailing: Column(
              children: [
                Text(
                  "$praic",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: pTextColor,
                  ),
                ),
                Text(
                  "$rate%",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: pTextColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
