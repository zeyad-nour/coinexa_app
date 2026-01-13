import 'package:coinexa_app/core/error/failures.dart';
import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'convert_repo.dart';
import '../model/convert_model/coinModel.dart';

class ConvertRepoImpl implements ConvertRepo {
  final ApiServes api;

  ConvertRepoImpl(this.api);
  
  @override
  Future<List<Coin>> fetchAllCoins() async {
      final data = await api.get(
      endpoint:
          'coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1',
    );

    return (data as List)
        .map(
          (json) => Coin(
            id: json['id'],
            name: json['name'],
            symbol: json['symbol'],
            icon: json['image'],
            usdPrice: (json['current_price'] as num).toDouble(),
          ),
        )
        .toList();
  }
  
  @override
  Future<Either<Failure, List<CoinsModel>>> fetchPrices({required List<String> coinIds}) async{
   try {
      final ids = coinIds.join(',');
      final data = await api.get(
        endpoint: 'coins/markets?vs_currency=usd&ids=$ids',
      );
      if (data is List) {
        List<CoinsModel> coinsPrice = data
            .map((item) => CoinsModel.fromJson(item))
            .toList();
        return right(coinsPrice);
      } else {
        return left(ServerFailuer("Invalid data format"));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }





}

