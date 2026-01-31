import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CoinLineChartHourly extends StatelessWidget {
  final List<double> prices; // قائمة الأسعار على مدار الساعة
  final Color lineColor;
  final Color backgroundTopColor;
  final Color backgroundBottomColor;

  const CoinLineChartHourly({
    super.key,
    required this.prices,
    this.lineColor = const Color(0xFF0288D1),
    this.backgroundTopColor = const Color(0xFFB3E5FC),
    this.backgroundBottomColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    // إنشاء نقاط الرسم
    final spots = List.generate(
      prices.length,
      (i) => FlSpot(i.toDouble(), prices[i]),
    );

    return SizedBox(
      height: 150,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (prices.length - 1).toDouble(),
          minY: prices.reduce((a, b) => a < b ? a : b) * 0.95, // أقل سعر -5% للتباعد
          maxY: prices.reduce((a, b) => a > b ? a : b) * 1.05, // أعلى سعر +5% للتباعد
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            verticalInterval: 1,
            horizontalInterval: (prices.reduce((a, b) => a > b ? a : b) -
                    prices.reduce((a, b) => a < b ? a : b)) /
                5,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.white12, strokeWidth: 1),
            getDrawingVerticalLine: (value) =>
                FlLine(color: Colors.white12, strokeWidth: 1),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  // كل نقطة تمثل 5 دقائق
                  final minute = (value * 5).toInt();
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "$minute m",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: (prices.reduce((a, b) => a > b ? a : b) -
                        prices.reduce((a, b) => a < b ? a : b)) /
                    5,
                getTitlesWidget: (value, meta) => Text(
                  "\$${value.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: lineColor,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    backgroundTopColor.withOpacity(0.3),
                    backgroundBottomColor.withOpacity(0.0),
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
