import 'package:coinexa_app/core/error/failures.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CoinsModel>>> featchTrending();
  // Future<Either<Failure, CoinsModel>> featchFeaturedBooks();
  // Future<Either<Failure, CoinsModel>> featchSuggestionsbook();
}
