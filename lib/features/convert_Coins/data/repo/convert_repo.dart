import 'package:coinexa_app/features/convert_Coins/data/model/convert_model/coinModel.dart';


abstract class ConvertRepo {
  Future<List<Coin>> fetchPrices({
    required List<String> coinIds,
  });
}
