import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.iamgeOne, fit: BoxFit.scaleDown);
  }
}
