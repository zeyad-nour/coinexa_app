part of 'compare_cubit.dart';

@immutable
abstract class CompareState {}

class CompareInitial extends CompareState {}

class CompareUpdated extends CompareState {
  final List<CoinsModel> coins;
  CompareUpdated(this.coins);
}

class CompareReady extends CompareState {
  final List<CoinsModel> coins;
  CompareReady(this.coins);
}

class CompareChartLoading extends CompareState {}

class CompareChartLoaded extends CompareState {
  final Map<String, List<double>> charts; 
  CompareChartLoaded(this.charts);
}

class CompareChartError extends CompareState {
  final String message;
  CompareChartError(this.message);
}
