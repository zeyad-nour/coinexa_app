import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/features/details/data/model/chart_Modil.dart';
import 'package:coinexa_app/features/details/data/repo/chart_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  final ApiServes api;

  DetailsRepoImpl(this.api);

  @override
  Future<List<ChartPoint>> fetchChart({
    required String coinId,
    required int days,
  }) async {
    final data = await api.get(
      endpoint:
          "coins/$coinId/market_chart?vs_currency=usd&days=$days",
    );

    final List prices = data['prices'];

    return prices
        .map((e) => ChartPoint.fromList(e))
        .toList();
  }
}
