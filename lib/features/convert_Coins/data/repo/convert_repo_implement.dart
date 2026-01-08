import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/features/convert_Coins/data/model/convert_model/coinModel.dart';
import 'convert_repo.dart';

class ConvertRepoImpl implements ConvertRepo {
  final ApiServes api;

  ConvertRepoImpl(this.api);

  @override
  Future<List<Coin>> fetchPrices({required List<String> coinIds}) async {
    final ids = coinIds.join(',');

    final data = await api.get(
      endpoint: 'coins/markets?vs_currency=usd&ids=$ids',
    );

    // data هنا هي قائمة من JSON لكل عملة
    return (data as List).map((json) {
      return Coin(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'],
        icon: json['image'], // رابط مباشر من API
        usdPrice: (json['current_price'] as num).toDouble(),
      );
    }).toList();
  }
}
