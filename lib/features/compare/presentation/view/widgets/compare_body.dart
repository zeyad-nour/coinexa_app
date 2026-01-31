// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/background_compare.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/cleareCompareWidget.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/coinLineChart.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/infoCardCompare.dart';
import 'package:coinexa_app/features/details/presentation/mange_state/cubit_chart/chart_mange_cubit.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coinexa_app/features/compare/presentation/state_mange/cubit/compare_cubit.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';

class CompareBody extends StatelessWidget {
  const CompareBody({super.key});

  @override
  Widget build(BuildContext context) {
    final chartCubit = ChartMangeCubit();
    List<CoinsModel> coins = [];
    return Scaffold(
      body: Stack(
        children: [
          BackgroundCompare(),
          Positioned(
            top: 77,
            left: 20,
            child: BackIconWidget(color: Color(0xFF81D4FA).withOpacity(0.5)),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: clearIteamsButtom(
              onPressed: () {
                context.read<CompareCubit>().clear();
              },
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Time Frame:", style: TextStyle(color: Colors.white70)),
                SizedBox(width: 10),
                BlocBuilder<CompareCubit, CompareState>(
                  builder: (context, state) {
                    return DropdownButton<TimeFrame>(
                      value: context.read<CompareCubit>().selectedTimeFrame,
                      dropdownColor: Colors.blueGrey,
                      style: TextStyle(color: Colors.white),
                      items: TimeFrame.values
                          .map(
                            (tf) => DropdownMenuItem(
                              value: tf,
                              child: Text(tf.name),
                            ),
                          )
                          .toList(),
                      onChanged: (tf) {
                        if (tf != null) {
                          context.read<CompareCubit>().changeTimeFrame(
                            tf,
                            chartCubit,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<CompareCubit, CompareState>(
            builder: (context, state) {
              if (state is CompareUpdated || state is CompareReady) {
                coins = context.read<CompareCubit>().compareList;
              }

              if (coins.isEmpty) {
                return Center(
                  child: Text(
                    "No coins selected yet",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                );
              }

              final strongest = context.read<CompareCubit>().getStrongestCoin();
              final chartData = (state is CompareChartLoaded)
                  ? state.charts
                  : {};

              return Positioned(
                top: 160,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    final prices = chartData[coin.id!] ?? [];

                    return GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: .noHeader,
                          dialogBackgroundColor: Colors.transparent,
                          barrierColor: Colors.black.withOpacity(0.3),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          ),
                          width: MediaQuery.sizeOf(context).width * 0.87,
                          buttonsBorderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          dismissOnTouchOutside: true,
                          dismissOnBackKeyPress: false,

                          headerAnimationLoop: false,
                          animType: AnimType.leftSlide,

                          desc: 'Are you sure about deleting it ?',
                          descTextStyle: Style.priceCrypto_TextStyle.copyWith(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          showCloseIcon: true,
                          closeIcon: Icon(
                            Icons.close,
                            color: colorSelectIteamRange,
                          ),

                          btnOkColor: Colors.red.withOpacity(0.6),
                          btnOkOnPress: () {
                            context.read<CompareCubit>().removeIteam(index);
                          },
                        ).show();
                      },
                      child: Card(
                        color: compareColor.withOpacity(0.7),
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Infocardcompare(
                              coin: coin,
                              strongest: strongest?.id ?? '',
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              height: 150,
                              child: prices.isEmpty
                                  ? Center(child: CircularProgressIndicator())
                                  : CoinLineChartHourly(prices: prices),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
