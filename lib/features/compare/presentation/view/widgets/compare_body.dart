// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/core/utils/widgets/back_icon_widget.dart';
import 'package:coinexa_app/features/compare/presentation/view/widgets/background_compare.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coinexa_app/features/compare/presentation/state_mange/cubit/compare_cubit.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';

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
            child: BackIconWidget(
              color: Color(0xFF81D4FA).withOpacity(0.5),
            ),
          ),
          BlocBuilder<CompareCubit, CompareState>(
            builder: (context, state) {
              final coins = context.watch<CompareCubit>().compareList;


              if (coins.isEmpty) {
                return Center(
                  child: Text(
                    "No coins selected yet",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                );
              }

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
                      color: Colors.blue.withOpacity(0.7),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        leading: Image.network(
                          coin.image??'',
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          coin.name??'unknown',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "\$${coin.currentPrice?.toStringAsFixed(2)} | ${coin.priceChange24h?.toStringAsFixed(2)}%",
                          style: TextStyle(color: Colors.white70),
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
