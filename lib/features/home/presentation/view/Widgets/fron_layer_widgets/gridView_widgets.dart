import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/assets.dart';
import 'package:coinexa_app/features/favorite/presentation/view/favorite_screen.dart';
import 'package:coinexa_app/features/convert_Coins/presentation/view/convert_Coins.dart';
import 'package:coinexa_app/features/home/presentation/view/Widgets/fron_layer_widgets/options_card_widgets.dart';
import 'package:flutter/material.dart';

class GridviewWidgets extends StatelessWidget {
  const GridviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,

      decoration: BoxDecoration(
        color: kPrimaryColors,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
          right: Radius.circular(50),
        ),
      ),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4,
          crossAxisSpacing: 0,

          mainAxisSpacing: 20,
        ),

        children: [
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => favoriteScreen()));
            },
            child: OptionsCardWidgets(
              imagename: AssetsData.watchlists,
              title: "Favorite",
            ),
          ),
          OptionsCardWidgets(imagename: AssetsData.compare, title: "Compare"),
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ConvertCoins()));
            },
            child: OptionsCardWidgets(
              imagename: AssetsData.convert,
              title: "Convert",
            ),
          ),
          OptionsCardWidgets(
            imagename: AssetsData.pricealert,
            title: "pricealert",
          ),
        ],
      ),
    );
  }
}
