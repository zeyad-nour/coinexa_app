// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/background_compare.dart';
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
    final chartCubit = ChartMangeCubit(); // Cubit واحد لجميع العملات

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
                          .map((tf) => DropdownMenuItem(
                                value: tf,
                                child: Text(tf.name),
                              ))
                          .toList(),
                      onChanged: (tf) {
                        if (tf != null) {
                          context.read<CompareCubit>().changeTimeFrame(tf, chartCubit);
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
              List<CoinsModel> coins = [];
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
              final chartData = (state is CompareChartLoaded) ? state.charts : {};

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

                    return Card(
                      color: compareColor.withOpacity(0.7),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Infocardcompare(coin: coin, strongest: strongest?.id ?? ''),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 150,
                            child: prices.isEmpty
                                ? Center(child: CircularProgressIndicator())
                                : CoinLineChartHourly(prices: prices,),
                          ),
                        ],
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
