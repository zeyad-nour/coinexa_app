part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitFailure extends HomeCubitState {
  final String errorMessage;

  HomeCubitFailure(this.errorMessage);
}

final class HomeCubitLoding extends HomeCubitState {}

final class HomeCubitSuccess extends HomeCubitState {
  final List<CoinsModel> coinsList;

  HomeCubitSuccess(this.coinsList);
}
