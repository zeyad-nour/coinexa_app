import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';
import 'package:coinexa_app/features/favorite/data/repo/FavoriteRepo.dart';

class Repoimplement implements Favoriterepo {
  @override
  void removeIteam(List<ModelFavoritcoin> favoritcoins, int index) {
    favoritcoins.removeAt(index);
  }
}
