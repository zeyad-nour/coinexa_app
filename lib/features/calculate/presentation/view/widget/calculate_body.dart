import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/calculate/presentation/view/widget/calculate_background_widget.dart';
import 'package:flutter/material.dart';

class CalculateBody extends StatelessWidget {
  const CalculateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CalculateBackgroundWidget(),
          // Positioned(
          //   top: 100,
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     child: Image.asset(AssetsData.bimageOne),
          //   ),
          // ),
          Positioned(top: 100, left: 20, child: BackIconWidget()),
        ],
      ),
    );
  }
}
