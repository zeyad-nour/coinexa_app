import 'package:bloc/bloc.dart';
import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final Box<ModelFavoritcoin> favoriteBox;

  FavoriteCubit(this.favoriteBox)
      : super(FavoriteSuccess(favoriteBox.values.toList()));

  
  void addItem(ModelFavoritcoin coin) {
    favoriteBox.add(coin); 
    emit(FavoriteSuccess(favoriteBox.values.toList())); 
  }

 
  
}
