import 'package:coinexa_app/core/utils/widgets/styles.dart';
import 'package:coinexa_app/features/details/presentation/mange_state/cubit_chart/chart_mange_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:coinexa_app/features/details/presentation/view/widgets/bottonselectRang.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:coinexa_app/conistant.dart';

class CryptoLineChart extends StatefulWidget {
  final String coinID;
  const CryptoLineChart({super.key, required this.coinID});

  @override
  State<CryptoLineChart> createState() => _CryptoLineChartState();
}

class _CryptoLineChartState extends State<CryptoLineChart> {
  TimeFrame selectedTimeFrame = TimeFrame.week;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChartMangeCubit>();

    return Column(
      children: [
        BottonselectRang(
          selectedTimeFrame: selectedTimeFrame,
          onChanged: (tf) {
            setState(() {
              selectedTimeFrame = tf;
            });
            // لما المستخدم يغير الوقت، نعمل reload للبيانات
            cubit.loadChart(coinId: widget.coinID, timeFrame: tf);
          },
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.30,
          child: BlocBuilder<ChartMangeCubit, ChartMangeState>(
            builder: (context, state) {
              if (state is ChartMangeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ChartMangeFailure) {
                return Center(
                  child: Text(
                    "Sorry , Failed to load chart data",
                    style: Style.priceCrypto_TextStyle,
                  ),
                );
              } else if (state is ChartMangeSuccess) {
                if (state.points.isEmpty) {
                  return Center(child: Text("No data available"));
                }

                final spots = state.points
                    .map((e) => FlSpot(e.x, e.y))
                    .toList();

                return LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
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
                );
              }

              return Container(); // default empty container
            },
          ),
        ),
      ],
    );
  }
}
