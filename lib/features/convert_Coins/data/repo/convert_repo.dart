import 'package:coinexa_app/core/error/failures.dart';
import 'package:coinexa_app/features/convert_Coins/data/model/convert_model/coinModel.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:dartz/dartz.dart';


abstract class ConvertRepo {
  Future<Either<Failure, List<CoinsModel>>> fetchPrices({
    required List<String> coinIds,
  });
   Future<List<Coin>> fetchAllCoins();
}
