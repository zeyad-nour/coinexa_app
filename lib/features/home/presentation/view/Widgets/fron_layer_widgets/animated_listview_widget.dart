import 'package:flutter/material.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'listviewCoins_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListViewWidget extends StatelessWidget {
  final List<CoinsModel> coins;
  const AnimatedListViewWidget({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        key: ValueKey(coins.hashCode),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: coins.length,
        itemBuilder: (context, index) {
          final coin = coins[index];

          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(microseconds: 50),
            duration: Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 60,
              child: FadeInAnimation(
                child: ListviewcoinsWidget(
                  imagecoin: coin.image ?? '',
                  title: coin.name ?? '',
                  subtitle: coin.symbol?.toUpperCase() ?? '',
                  praic: coin.currentPrice ?? 0,
                  rate: coin.priceChangePercentage24h ?? 0,
                  coinsID: coin.id ?? '',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
