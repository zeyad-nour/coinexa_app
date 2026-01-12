import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final Icon iconRate;
  final String rate;
  const RateWidget({super.key, required this.iconRate, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
        Text(rate, style: Style.rateStyle_TextStyle),
      ],
    );
  }
}
