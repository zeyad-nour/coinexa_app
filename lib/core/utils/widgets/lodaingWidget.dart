import 'package:coinexa_app/conistant.dart';
import 'package:flutter/material.dart';

class Lodaingwidget extends StatelessWidget {
  const Lodaingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: sTextColorDetailsPage);
  }
}
