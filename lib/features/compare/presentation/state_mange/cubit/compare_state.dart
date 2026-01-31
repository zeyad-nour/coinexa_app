part of 'compare_cubit.dart';

@immutable
sealed class CompareState {}

final class CompareInitial extends CompareState {}

final class CompareUpdated extends CompareState {
  final List<CoinsModel> coins;
  CompareUpdated(this.coins);
}

final class CompareReady extends CompareState {
  final List<CoinsModel> coins;
  CompareReady(this.coins);
}
