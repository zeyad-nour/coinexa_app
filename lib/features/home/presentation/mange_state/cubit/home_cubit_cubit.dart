// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:coinexa_app/features/home/data/Model/coins_model/coins_model.dart';
import 'package:coinexa_app/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit(this.homeRepo) : super(HomeCubitInitial());
  final HomeRepo homeRepo;
  Future<void> featchTrending() async {
    emit(HomeCubitLoding());
    var Response = await homeRepo.featchTrending();
    Response.fold(
      (Failure) => emit(HomeCubitFailure(Failure.errorMessage)),
      (coins) => emit(HomeCubitSuccess(coins)),
    );
  }
}
