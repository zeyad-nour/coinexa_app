// ignore_for_file: camel_case_types

import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/core/utils/widgets/head_title_widget.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_background_widget.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_card.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/image_widget.dart';
import 'package:flutter/material.dart';

class favoriteBody extends StatelessWidget {
  const favoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CalculateBackgroundWidget(),

          Positioned(top: 81, left: 20, child: BackIconWidget()),
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
          Positioned(
            top: 110,

            left: 140,

            child: HeadTitleWidget(headTitle: "Favorite"),
          ),
          Positioned(top: 200, child: FavoriteCard()),
        ],
      ),
    );
  }
}
