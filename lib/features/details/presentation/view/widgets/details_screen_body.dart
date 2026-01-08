import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/details/presentation/mange_state/cubit_chart/chart_mange_cubit.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/backgroun_page_details.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/buttom_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/cryptoLineChart.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/head_title_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/info_Card_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/left_icon_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/price_crypto_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/rate_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreenBody extends StatelessWidget {
  final double price;
  final double rate;
  final String headtitle;
  final String coinId;
  final String name;
  final String imageUrl;
  const DetailsScreenBody({
    super.key,
    required this.price,
    required this.rate,
    required this.headtitle,
    required this.coinId,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            ChartMangeCubit()
              ..loadChart(coinId: coinId, timeFrame: TimeFrame.week),
        child: Stack(
          children: [
            BackgrounPageDetails(),
            Positioned(top: 60, left: 20, child: BackIconWidget()),
            Positioned(
              top: 80,
              left: 150,
              child: HeadTitleWidget(headTitle: headtitle),
            ),
            Positioned(top: 60, right: 20, child: LeftIconWidget()),
            Positioned(
              top: 130,
              left: 120,
              child: Center(child: PriceCryptoWidget(price: price.toString())),
            ),
            Positioned(
              top: 180,
              left: 180,
              child: RateWidget(
                rate: rate.toString(),
                iconRate: Icon(Icons.arrow_drop_up_outlined),
              ),
            ),
            Positioned(
              top: 280,
              left: 20,
              right: 20,
              child: CryptoLineChart(coinID: coinId),
            ),
            Positioned(
              top: 900,
              left: 50,
              child: ButtonWidget(
                colortext: sTextColorDetailsPage,
                text: "Set Alert",
                colorbutton: Color(0xffFAFBFB),
              ),
            ),
            Positioned(
              top: 900,
              right: 50,
              child: ButtonWidget(
                colortext: kPrimaryColorsTow,
                text: "Set Alert",
                colorbutton: pTextColorDetailsPage,
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              child: InfoCardWidget(
                image: imageUrl,
                namecoin: name,
                lastprice: price,
                rat: rate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
