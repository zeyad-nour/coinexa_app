import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_card.dart';
import 'package:flutter/material.dart';

class Listviewfavoritecard extends StatelessWidget {
  final List<ModelFavoritcoin> favoritcoins;

  const Listviewfavoritecard({super.key, required this.favoritcoins});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoritcoins.length,
      itemBuilder: (context, index) {
        final coin = favoritcoins[index];

        return GestureDetector(
          onLongPress: () {
            AwesomeDialog(
              context: context,
              dialogType: .noHeader,
              borderSide: const BorderSide(
                color: backgroundColorCalculate,
                width: 2,
              ),
              width: MediaQuery.sizeOf(context).width * 0.87,
              buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
              dismissOnTouchOutside: true,
              dismissOnBackKeyPress: false,

              headerAnimationLoop: false,
              animType: AnimType.leftSlide,

              desc: 'Are you sure about deleting it ?',
              descTextStyle: Style.priceCrypto_TextStyle.copyWith(fontSize: 22),
              showCloseIcon: true,
              btnCancelOnPress: () {
                Navigator.of(context).pop();
              },
              btnOkOnPress: () {
          
                favoritcoins.remove(coin);
              },
            ).show();
          },

          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FavoriteCard(
              namecoin: coin.namecoin,
              price: coin.price,
              rate: coin.rate,
              imageUrl: coin.imageUrl,
            ),
          ),
        );
      },
    );
  }
}
