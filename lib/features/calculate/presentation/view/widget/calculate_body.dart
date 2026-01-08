import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/calculate/presentation/view/widget/calculate_background_widget.dart';
import 'package:coinexa_app/features/calculate/presentation/view/widget/image_widget.dart';
import 'package:flutter/material.dart';

class CalculateBody extends StatelessWidget {
  const CalculateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CalculateBackgroundWidget(),

          Positioned(top: 100, left: 20, child: BackIconWidget()),
          Positioned(
            top: 460,
            left: 00,
            child: ImageWidgetBackGround(
              imagename: AssetsData.bimageOne,

              width: 400,
              height: 500,
            ),
          ),
          Positioned(
            top: 320,
            right: 00,
            child: ImageWidgetBackGround(
              imagename: AssetsData.bimageTow,
              width: 200,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
