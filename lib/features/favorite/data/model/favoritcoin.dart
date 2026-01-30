import 'package:hive/hive.dart';

part 'favoritcoin.g.dart';

@HiveType(typeId: 1)
class ModelFavoritcoin extends HiveObject {

  @HiveField(0)
  String namecoin;

  @HiveField(1)
  double price;

  @HiveField(2)
  String imageUrl;

  @HiveField(3)
  double rate;

  ModelFavoritcoin(
    this.namecoin,
    this.price,
    this.imageUrl,
    this.rate,
  );
}
