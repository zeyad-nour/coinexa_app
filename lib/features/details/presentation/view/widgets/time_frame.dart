enum TimeFrame { hour, day, week, month, year }

String timeFrameToString(TimeFrame tf) {
  switch (tf) {
    case TimeFrame.hour:
      return 'Hour';
    case TimeFrame.day:
      return 'Day';
    case TimeFrame.week:
      return 'Week';
    case TimeFrame.month:
      return 'Month';
    case TimeFrame.year:
      return 'Year';
  }
}
