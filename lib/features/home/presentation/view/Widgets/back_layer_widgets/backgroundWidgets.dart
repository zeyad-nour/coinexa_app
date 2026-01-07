// ignore_for_file: file_names

import 'package:coinexa_app/features/home/presentation/view/Widgets/back_layer_widgets/TextWidgetTow.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/back_layer_widgets/Text_Widget.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/back_layer_widgets/image_widget.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/back_layer_widgets/learnMoreButtom_widget.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/back_layer_widgets/topIcon_widet.dart';
import 'package:flutter/material.dart';

class Backgroundwidgets extends StatelessWidget {
  const Backgroundwidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[200],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(top: 60, left: 30, child: TextWidget()),
          Positioned(top: 200, left: 40, child: Textwidgettow()),
          Positioned(top: 180, right: 10, child: ImageWidget()),
          Positioned(top: 270, left: 40, child: LearnmorebuttomWidget()),
          Positioned(top: 60, right: 20, child: TopiconWidet()),
          
        ],
      ),
    );
  }
}
