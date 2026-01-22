import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/presentation/view/widget/Favorite_card.dart';
import 'package:flutter/material.dart';

class Listviewfavoritecard extends StatelessWidget {
  final List<ModelFavoritcoin> favoritcoins;

  const Listviewfavoritecard({
    super.key,
    required this.favoritcoins,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoritcoins.length,
      itemBuilder: (context, index) {
        final coin = favoritcoins[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FavoriteCard(
            namecoin: coin.namecoin,
            price: coin.price,
            subtitle: coin.subtitle,
            rate: coin.rate,
            imageUrl: coin.imageUrl,
          ),
        );
      },
    );
  }
}
