import 'package:bloc/bloc.dart';
import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/data/repo/repoImplement.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final Repoimplement repoimplement;
  FavoriteCubit(this.repoimplement) : super(FavoriteInitial());

  void deleteIteam(List<ModelFavoritcoin> favoritcoins, int index) {
    repoimplement.removeIteam(favoritcoins, index);
    emit(FavoriteSuccess(favoritcoins));
  }
}
