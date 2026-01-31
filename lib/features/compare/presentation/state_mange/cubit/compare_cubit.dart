import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:coinexa_app/features/details/presentation/mange_state/cubit_chart/chart_mange_cubit.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';

part 'compare_state.dart';

class CompareCubit extends Cubit<CompareState> {
  CompareCubit() : super(CompareInitial());

  List<CoinsModel> compareList = [];
  TimeFrame selectedTimeFrame = TimeFrame.hour;

  Map<String, List<double>> chartData = {};

  void addCoin(CoinsModel coin) {
    if (!compareList.contains(coin)) {
      compareList.add(coin);
      emit(CompareUpdated(List.from(compareList)));
    }
    if (compareList.length == 2) {
      emit(CompareReady(List.from(compareList)));
    }
  }

  void clear() {
    compareList.clear();
    chartData.clear();
    emit(CompareInitial());
  }

  CoinsModel? getStrongestCoin() {
    if (compareList.isEmpty) return null;
    compareList.sort((a, b) => (b.priceChange24h ?? 0).compareTo(a.priceChange24h ?? 0));
    return compareList.first;
  }

  void changeTimeFrame(TimeFrame tf, ChartMangeCubit chartCubit) {
    selectedTimeFrame = tf;
    emit(CompareUpdated(List.from(compareList))); 
    loadChartsForAllCoins(chartCubit);
  }

  Future<void> loadChartsForAllCoins(ChartMangeCubit chartCubit) async {
    try {
      emit(CompareChartLoading());
      chartData.clear();

      for (var coin in compareList) {
        await chartCubit.loadChart(coinId: coin.id!, timeFrame: selectedTimeFrame);

        if (chartCubit.state is ChartMangeSuccess) {
          final points = (chartCubit.state as ChartMangeSuccess).points;
          chartData[coin.id!] = points.map((e) => e.y).toList();
        }
      }

      emit(CompareChartLoaded(Map.from(chartData)));
    } catch (e) {
      emit(CompareChartError("Failed to load chart data"));
    }
  }
}
