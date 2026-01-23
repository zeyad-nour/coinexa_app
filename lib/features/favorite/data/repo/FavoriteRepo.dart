import 'package:coinexa_app/features/favorite/data/model/favoritcoin.dart';

abstract class Favoriterepo {
  void removeIteam(List<ModelFavoritcoin> favoritcoins, int index);
}
