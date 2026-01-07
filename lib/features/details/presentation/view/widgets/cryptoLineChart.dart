// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/bottonselectRang.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/selectIteamFram.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoLineChart extends StatefulWidget {
  const CryptoLineChart({super.key});

  @override
  State<CryptoLineChart> createState() => _CryptoLineChartState();
}

class _CryptoLineChartState extends State<CryptoLineChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottonselectRang(),
        const SizedBox(height: 60),
        SizedBox(
          height: 190,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: getSpots(),
                  isCurved: true,
                  color: colorLinechartofgraph,
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        secoundBackgroundColor.withOpacity(0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
