import 'package:coinexa_app/features/details/presentation/view/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/backgroun_page_details.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/cryptoLineChart.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/head_title_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/left_icon_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/price_crypto_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/rate_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgrounPageDetails(),
          Positioned(top: 60, left: 20, child: BackIconWidget()),
          Positioned(
            top: 80,
            left: 150,
            child: HeadTitleWidget(headTitle: "Etherium (ETH)"),
          ),
          Positioned(top: 60, right: 20, child: LeftIconWidget()),
          Positioned(
            top: 130,
            left: 120,
            child: Center(child: PriceCryptoWidget(price: "32,128,800")),
          ),
          Positioned(
            top: 180,
            left: 180,
            child: RateWidget(
              rate: "2.5",
              iconRate: Icon(Icons.arrow_drop_up_outlined),
            ),
          ),
          Positioned(top: 300, left: 20, right: 20, child: CryptoLineChart()),
        ],
      ),
    );
  }
}
