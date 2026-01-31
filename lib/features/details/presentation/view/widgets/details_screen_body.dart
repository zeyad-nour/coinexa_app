import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/refreshIcon_widet.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/details/presentation/mange_state/cubit_chart/chart_mange_cubit.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/backgroun_page_details.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/buttom_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/cryptoLineChart.dart';
import 'package:coinexa_app/core/utils/widgets/head_title_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/info_Card_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/price_crypto_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/rate_widget.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/presentation/StateManage/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreenBody extends StatefulWidget {
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
  State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
}

class _DetailsScreenBodyState extends State<DetailsScreenBody> {
  late final ChartMangeCubit chartCubit;

  @override
  void initState() {
    super.initState();
    chartCubit = ChartMangeCubit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        chartCubit.loadChart(coinId: widget.coinId, timeFrame: TimeFrame.week);
      }
    });
  }

  @override
  void dispose() {
    chartCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chartCubit,
      child: Scaffold(
        body: Stack(
          children: [
            BackgrounPageDetails(),
            Positioned(top: 60, left: 20, child: BackIconWidget(color: bacgroundIconButtom,)),
            Positioned(
              top: 70,
              left: 100,
              child: HeadTitleWidget(headTitle: widget.headtitle),
            ),
            Positioned(top: 60, right: 20, child: RefreshiconWidet()),
            Positioned(
              top: 110,
              left: 120,
              child: PriceCryptoWidget(price: widget.price.toString()),
            ),
            Positioned(
              top: 150,
              left: 150,
              child: RateWidget(
                rate: widget.rate.toString(),
                iconRate: const Icon(Icons.arrow_drop_up_outlined),
              ),
            ),
            Positioned(
              top: 230,
              left: 10,
              right: 10,
              child: CryptoLineChart(coinID: widget.coinId),
            ),
            Positioned(
              top: 700,
              left: 50,
              child: ButtonWidget(
                colortext: sTextColorDetailsPage,
                text: "Set Alert",
                colorbutton: const Color(0xffFAFBFB),
              ),
            ),
            Positioned(
              top: 700,
              right: 50,
              child: ButtonWidget(
                onPressed: () {
                  context.read<FavoriteCubit>().addItem(
                    ModelFavoritcoin(
                      widget.headtitle,
                      widget.price,
                      widget.imageUrl,
                      widget.rate,
                      DateTime.now(),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.pink[200],
                      showCloseIcon: true,
                      content: Text(
                        "Added to Favorite! You can visit Favorite page.",
                        style: Style.TextStyle18,
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                colortext: kPrimaryColorsTow,
                text: "Favorite",
                colorbutton: pTextColorDetailsPage,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: InfoCardWidget(
                image: widget.imageUrl,
                namecoin: widget.name,
                lastprice: widget.price,
                rat: widget.rate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
