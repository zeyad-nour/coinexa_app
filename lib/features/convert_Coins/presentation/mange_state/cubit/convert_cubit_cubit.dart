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
    final eitherPrices = await repo.fetchPrices(coinIds: [fromCoinId, toCoinId]);

    eitherPrices.fold(
      (failure) => emit(ConvertFailure(failure.toString())),
      (pricesList) {
      
        final fromPrice = pricesList[0].currentPrice; 
        final toPrice = pricesList[1].currentPrice;

        final result = amount * fromPrice! / toPrice!;

        emit(ConvertSuccess(result));
      },
    );
  } catch (e) {
    emit(ConvertFailure(e.toString()));
  }
}


  Future<List<Coin>> fetchCoins() async {
    try {
      final data = await repo.fetchAllCoins();
      return data;
    } catch (e) {
      throw Exception('Failed to fetch coins: $e');
    }
  }
}
