import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:flutter/material.dart';

class Infocardcompare extends StatelessWidget {
  final CoinsModel coin;
  final String ?strongest;
  const Infocardcompare({super.key, required this.coin, required this.strongest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(coin.image ?? '', width: 40, height: 40),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name ?? 'unknown',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "\$${coin.currentPrice?.toStringAsFixed(2)} | ${coin.priceChange24h?.toStringAsFixed(2)}%",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              Spacer(),
              if (coin.id == strongest)
                Icon(Icons.star, color: Colors.yellow),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}



  // SizedBox(
  //           height: 100,
  //           child: LineChart(
  //             LineChartData(
  //               gridData: FlGridData(show: false),
  //               titlesData: FlTitlesData(show: false),
  //               borderData: FlBorderData(show: false),
  //               lineBarsData: [
  //                 LineChartBarData(
  //                   spots: List.generate(
  //                     10,
  //                     (i) => FlSpot(
  //                       i.toDouble(),
  //                       (coin.currentPrice ?? 0) * (0.9 + 0.02 * i),
  //                     ),
  //                   ),
  //                   isCurved: true,
  //                   barWidth: 3,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),