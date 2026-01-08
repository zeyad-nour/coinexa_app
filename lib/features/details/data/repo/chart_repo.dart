import 'package:coinexa_app/features/details/data/model/chart_Modil.dart';

abstract class DetailsRepo {
  Future<List<ChartPoint>> fetchChart({
    required String coinId,
    required int days,
  });
}
