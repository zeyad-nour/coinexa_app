import 'package:flutter/material.dart';

class ImageWidgetBackGround extends StatelessWidget {
  final String imagename;
  final double width;
  final double height;
  const ImageWidgetBackGround({
    super.key,
    required this.imagename,
    required this.width, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagename, fit: BoxFit.cover, width: width, height: height);
  }
}
