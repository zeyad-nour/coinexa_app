import 'package:coinexa_app/features/calculate/presentation/view/widget/calculate_background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateBody extends StatelessWidget {
  const CalculateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack( 
        children: [
          CalculateBackgroundWidget(),
          
        ],
      ),
    );
  }
}
