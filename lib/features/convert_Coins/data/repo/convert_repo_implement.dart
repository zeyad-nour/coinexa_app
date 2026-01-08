import 'package:coinexa_app/core/utils/api_serves.dart';
import 'convert_repo.dart';
import '../model/convert_model/coinModel.dart';

class ConvertRepoImpl implements ConvertRepo {
  final ApiServes api;

  ConvertRepoImpl(this.api);

  @override
  Future<List<Coin>> fetchAllCoins() async {
    final data = await api.get(
      endpoint: 'coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1',
    );

    return (data as List).map((json) => Coin(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      icon: json['image'],
      usdPrice: (json['current_price'] as num).toDouble(),
    )).toList();
  }
  Future<List<Coin>> fetchPrices({required List<String> coinIds}) async {
    final ids = coinIds.join(',');
    final data = await api.get(
      endpoint: 'coins/markets?vs_currency=usd&ids=$ids',
    );

    return (data as List).map((json) {
      return Coin(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'].toUpperCase(),
        icon: json['image'], // رابط مباشر من API
        usdPrice: (json['current_price'] as num).toDouble(),
      );
    }).toList();
  }
}
