import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_mange_state.dart';

class ChartMangeCubit extends Cubit<ChartMangeState> {
  ChartMangeCubit() : super(ChartMangeInitial());
}
