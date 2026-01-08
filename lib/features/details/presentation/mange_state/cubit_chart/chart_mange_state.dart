part of 'chart_mange_cubit.dart';

@immutable
sealed class ChartMangeState {}

final class ChartMangeInitial extends ChartMangeState {}

final class ChartMangeLoading extends ChartMangeState {}

final class ChartMangeSuccess extends ChartMangeState {
  final List<ChartPoint> points;

  ChartMangeSuccess(this.points);
}

final class ChartMangeFailure extends ChartMangeState {
  final String message;

  ChartMangeFailure(this.message);
}
