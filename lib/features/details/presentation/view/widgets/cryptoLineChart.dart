// ignore_for_file: deprecated_member_use

import 'package:coinexa_app/conistant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoLineChart extends StatelessWidget {
  const CryptoLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,

            horizontalInterval: 0.622,
          ),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),

          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(1, 2.8),
                FlSpot(2, 3.5),
                FlSpot(3, 3.2),
                FlSpot(4, 4),
                FlSpot(5, 3.6),
                FlSpot(6, 3.9),
                FlSpot(7, 3.4),
                FlSpot(8, 3.2),
              ],
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
    );
  }
}
