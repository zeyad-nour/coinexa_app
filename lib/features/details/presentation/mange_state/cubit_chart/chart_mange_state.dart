part of 'chart_mange_cubit.dart';

@immutable
sealed class ChartMangeState {}

final class ChartMangeInitial extends ChartMangeState {}
final class ChartMangeLooding extends ChartMangeState {}
final class ChartMangeSucess extends ChartMangeState {}
