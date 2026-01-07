import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:flutter/material.dart';

class PriceCryptoWidget extends StatelessWidget {
  final String price;
  const PriceCryptoWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("\$$price", style: Style.priceCrypto_TextStyle));
  }
}
