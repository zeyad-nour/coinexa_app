import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_card.dart';
import 'package:flutter/material.dart';

class Listviewfavoritecard extends StatelessWidget {
  final ModelFavoritcoin favoritcoins;


  const Listviewfavoritecard({
    super.key, required this.favoritcoins, required String nameCoin,
 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.06)),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return FavoriteCard(
            namecoin:favoritcoins.namecoin ,
            price: favoritcoins.price,
            subtitle: favoritcoins.subtitle,
            rate: favoritcoins.rate,
            imageUrl: favoritcoins.imageUrl,
          );
        },
      ),
    );
  }
}
