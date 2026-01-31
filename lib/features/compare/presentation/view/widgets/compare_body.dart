// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/background_compare.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/coinLineChart.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/infoCardCompare.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coinexa_app/features/compare/presentation/state_mange/cubit/compare_cubit.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:fl_chart/fl_chart.dart'; // لازم تضيف dependency في pubspec.yaml

class CompareBody extends StatelessWidget {
  const CompareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundCompare(),
          Positioned(
            top: 77,
            left: 20,
            child: BackIconWidget(color: Color(0xFF81D4FA).withOpacity(0.5)),
          ),
          BlocBuilder<CompareCubit, CompareState>(
            builder: (context, state) {
              List<CoinsModel> coins = [];
              if (state is CompareUpdated) coins = state.coins;
              if (state is CompareReady) coins = state.coins;

              if (coins.isEmpty) {
                return Center(
                  child: Text(
                    "No coins selected yet",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                );
              }

              final strongest = context.read<CompareCubit>().getStrongestCoin();

              return Positioned(
                top: 150,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    return Card(
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
                          CoinLineChartHourly(
                            prices: List.generate(
                              coins.length,
                              (i) =>
                                  (coin.currentPrice ?? 0) * (0.9 + 0.02 * i),
                            ),
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
