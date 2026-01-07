import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:fl_chart/fl_chart.dart';

TimeFrame selectedTimeFrame = TimeFrame.week; 

List<FlSpot> getSpots() {
  switch (selectedTimeFrame) {
    case TimeFrame.hour:
      return [FlSpot(0, 3), FlSpot(1, 2.8), FlSpot(2, 3.1), FlSpot(3, 3.2), FlSpot(4, 3.5)];
    case TimeFrame.day:
      return [FlSpot(0, 3), FlSpot(1, 2.8), FlSpot(2, 3.5), FlSpot(3, 3.2), FlSpot(4, 4), FlSpot(5, 3.6), FlSpot(6, 3.9)];
    case TimeFrame.week:
      return [FlSpot(0, 3), FlSpot(1, 2.8), FlSpot(2, 3.5), FlSpot(3, 3.2), FlSpot(4, 4), FlSpot(5, 3.6), FlSpot(6, 3.9), FlSpot(7, 3.4), FlSpot(8, 3.2)];
    case TimeFrame.month:
      return [for (int i = 0; i < 30; i++) FlSpot(i.toDouble(), 3 + i % 5 * 0.1)];
    case TimeFrame.year:
      return [for (int i = 0; i < 12; i++) FlSpot(i.toDouble(), 3 + i % 5 * 0.3)];
  }
}
