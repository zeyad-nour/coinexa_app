part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  List<ModelFavoritcoin> coins = [];
  FavoriteSuccess(this.coins);
}
