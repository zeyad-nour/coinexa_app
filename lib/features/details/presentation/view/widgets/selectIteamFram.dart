import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:fl_chart/fl_chart.dart';

// TimeFrame selectedTimeFrame = TimeFrame.week;

List<FlSpot> getSpots(TimeFrame timeFrame) {
  switch (timeFrame) {
    case TimeFrame.hour:
      return List.generate(12, (i) => FlSpot(i.toDouble(), 3 + i * 0.1));

    case TimeFrame.day:
      return List.generate(24, (i) => FlSpot(i.toDouble(), 3 + (i % 5) * 0.2));

    case TimeFrame.week:
      return List.generate(7, (i) => FlSpot(i.toDouble(), 3 + (i % 4) * 0.3));

    case TimeFrame.month:
      return List.generate(30, (i) => FlSpot(i.toDouble(), 3 + (i % 6) * 0.15));

    case TimeFrame.year:
      return List.generate(12, (i) => FlSpot(i.toDouble(), 3 + (i % 5) * 0.4));
  }
}
