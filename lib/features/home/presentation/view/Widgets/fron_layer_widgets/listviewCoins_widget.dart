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
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(60),
              right: Radius.circular(60),
            ),
          ),
          child: Card(
            color: kPrimaryColors,
            elevation: 0,

            child: InkWell(
              borderRadius: BorderRadius.circular(60),
              splashColor: const Color.fromARGB(
                255,
                255,
                153,
                187,
              ).withOpacity(0.2),

              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (c) => DetailsScreen()));
              },
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
                title: Text(
                  title,
                  style: Style.TextStyle18.copyWith(fontSize: 20),
                ),
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
            ),
          ),
        );
      },
    );
  }
}
