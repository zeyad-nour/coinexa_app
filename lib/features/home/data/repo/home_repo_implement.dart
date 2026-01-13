import 'package:coinexa_app/core/error/failures.dart';
import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:coinexa_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiServes apiService;
  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<CoinsModel>>> featchTrending() async {
    try {
      final data = await apiService.get(
        endpoint:
            "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false",
      );

      if (data is List) {  //for remember ensure the data is json array not json object
        List<CoinsModel> coinsInfo =
            data.map((item) => CoinsModel.fromJson(item)).toList();
        return right(coinsInfo);
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
