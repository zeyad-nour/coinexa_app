import 'package:coinexa_app/features/convert_Coins/presentation/view/widget/bachground_Convert.dart';
import 'package:flutter/material.dart';

class ConvertCoinsbody extends StatelessWidget {
  const ConvertCoinsbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack( 
        children: [
          BachgroundConvert()
        ],
      ),
    );
  }
}
