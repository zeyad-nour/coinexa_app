// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'listviewCoins_widget.dart';

class AnimatedListViewWidget extends StatelessWidget {
  final List<CoinsModel> coins;
  const AnimatedListViewWidget({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: ValueKey(coins.hashCode), // إعادة بناء عند تغير القائمة
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: ListviewcoinsWidget(
            imagecoin: coin.image ?? '',
            title: coin.name ?? '',
            subtitle: coin.symbol?.toUpperCase() ?? '',
            praic: coin.currentPrice ?? 0,
            rate: coin.priceChangePercentage24h ?? 0,
            coinsID: coin.id ?? '',
          ),
        );
      },
    );
  }
}
