// ignore_for_file: camel_case_types

import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/core/utils/widgets/head_title_widget.dart';
import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/presentation/StateManage/cubit/favorite_cubit.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_background_widget.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/image_widget.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/listViewFavoriteCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ModelFavoritcoin> favoriteCoins = [];

class favoriteBody extends StatelessWidget {
  const favoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CalculateBackgroundWidget(),

          Positioned(top: 77, left: 20, child: BackIconWidget()),
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
            top: 100,

            left: 170,

            child: HeadTitleWidget(headTitle: "Favorite"),
          ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteSuccess) {
                return Positioned.fill(
                  top: MediaQuery.sizeOf(context).height * 0.18,
                  child: Listviewfavoritecard(favoritcoins: state.coins),
                );
              }
              return Positioned(
                top: 200,
                left: 120,
                child: Text("Not Found Favorite Iteams"),
              );
            },
          ),
        ],
      ),
    );
  }
}
