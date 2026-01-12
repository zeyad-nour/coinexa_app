// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:coinexa_app/features/home/data/repo/home_repo_implement.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  final HomeRepoImplement repo;

  HomeCubitCubit(this.repo) : super(HomeCubitInitial());

  Future<void> featchTrending({bool isRefresh = false}) async {
    if (!isRefresh && state is! HomeCubitSuccess) {
      emit(HomeCubitLoding());
    }


    final result = await repo.featchTrending();

    result.fold(
      (failure) => emit(HomeCubitFailure(failure.errorMessage)),
      (coins) {
        coins.sort((b, a) => (a.currentPrice ?? 0).compareTo(b.currentPrice ?? 0));//algorithm sort
        emit(HomeCubitSuccess(coinsList: coins));
      },
    );
  }
}
