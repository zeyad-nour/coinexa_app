import 'package:bloc/bloc.dart';
import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteSuccess([]));

  void addItem(ModelFavoritcoin coin) {
    final currentCoins = List<ModelFavoritcoin>.from(
      (state as FavoriteSuccess).coins,
    );
    currentCoins.add(coin);
    emit(FavoriteSuccess(currentCoins));
  }

  void deleteItem(int index) {
    final currentCoins = List<ModelFavoritcoin>.from(
      (state as FavoriteSuccess).coins,
    );
    currentCoins.removeAt(index);
    emit(FavoriteSuccess(currentCoins));
  }
}
