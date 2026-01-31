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
    }

    // لما يبقى فيه عملتين، emit جاهزية للـ compare
    if (compareList.length == 2) {
      emit(CompareReady(compareList));
    }
  }

  void clear() {
    compareList.clear();
    emit(CompareInitial());
  }
}
