import 'package:bloc/bloc.dart';
import 'package:coinexa_app/core/utils/api_serves.dart';
import 'package:coinexa_app/features/details/data/model/chart_Modil.dart';
import 'package:coinexa_app/features/details/data/repo/chart_repo_Implement.dart';
import 'package:coinexa_app/features/details/presentation/view/widgets/time_frame.dart';
import 'package:dio/dio.dart';

import 'package:coinexa_app/features/details/data/repo/chart_repo.dart';
import 'package:flutter/material.dart';

part 'chart_mange_state.dart';

class ChartMangeCubit extends Cubit<ChartMangeState> {
  DetailsRepo repo = DetailsRepoImpl(ApiServes(Dio()));

  ChartMangeCubit() : super(ChartMangeInitial());

  Future<void> loadChart({
    required String coinId,
    required TimeFrame timeFrame,
  }) async {
    emit(ChartMangeLoading());

    try {
      final days = _mapTimeFrameToDays(timeFrame);
      final points = await repo.fetchChart(coinId: coinId, days: days);

      emit(ChartMangeSuccess(points));
    } catch (e) {
      emit(ChartMangeFailure(e.toString()));
    }
  }

  int _mapTimeFrameToDays(TimeFrame tf) {
    switch (tf) {
      case TimeFrame.hour:
        return 1;
      case TimeFrame.day:
        return 1;
      case TimeFrame.week:
        return 7;
      case TimeFrame.month:
        return 30;
      case TimeFrame.year:
        return 365;
    }
  }
}
