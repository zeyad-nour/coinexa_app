// ignore_for_file: file_names

import 'package:coinexa_app/features/home/presentation/view/Widgets/backgroundWidgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Column(children: [ 
        Backgroundwidgets()
      ],),
    );
  }
}
