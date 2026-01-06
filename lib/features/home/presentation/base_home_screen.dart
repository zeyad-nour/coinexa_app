import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class BaseHomeScreen extends StatelessWidget {
  const BaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.pink[200],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              
            ],

          ),
        ),
        
      ],
    );
  }
}
