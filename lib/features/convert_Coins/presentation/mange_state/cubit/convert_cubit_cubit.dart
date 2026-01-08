import 'package:bloc/bloc.dart';
import 'package:coinexa_app/features/convert_Coins/data/model/convert_model/coinModel.dart';
import 'package:coinexa_app/features/convert_Coins/data/repo/convert_repo.dart';

part 'convert_cubit_state.dart';

class ConvertCubit extends Cubit<ConvertCubitState> {
  final ConvertRepo repo;

  ConvertCubit(this.repo) : super(ConvertCubitInitial());

  Future<void> convert({
    required String fromCoinId,
    required String toCoinId,
    required double amount,
  }) async {
    emit(ConvertLoading());

    try {
      final prices = await repo.fetchPrices(coinIds: [fromCoinId, toCoinId]);

      final fromPrice = prices
          .firstWhere((e) => e.id == fromCoinId)
          .usdPrice;

      final toPrice = prices.firstWhere((e) => e.id == toCoinId).usdPrice;

      final result = amount * fromPrice / toPrice;

      emit(ConvertSuccess(result));
    } catch (e) {
      emit(ConvertFailure(e.toString()));
    }
  }
 Future<List<Coin>> fetchCoins() async {
  try {
    final data = await repo.fetchAllCoins(); // method جديدة في repo
    return data; // هتكون List<Coin> من API
  } catch (e) {
    throw Exception('Failed to fetch coins: $e');
  }
}

}
