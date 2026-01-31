import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';

part 'compare_state.dart';

class CompareCubit extends Cubit<CompareState> {
  CompareCubit() : super(CompareInitial());

  List<CoinsModel> compareList = [];

  void addCoin(CoinsModel coin) {
    if (!compareList.contains(coin)) {
      compareList.add(coin);
      emit(CompareUpdated(List.from(compareList))); // تحديث الشاشة بعد كل إضافة
    }

    if (compareList.length == 2) {
      emit(CompareReady(List.from(compareList)));
    }
  }

  void clear() {
    compareList.clear();
    emit(CompareInitial());
  }

  CoinsModel? getStrongestCoin() {
    if (compareList.isEmpty) return null;
    compareList.sort((a, b) => (b.priceChange24h ?? 0).compareTo(a.priceChange24h ?? 0));
    return compareList.first;
  }
}
