import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'compare_state.dart';

class CompareCubit extends Cubit<CompareState> {
  CompareCubit() : super(CompareInitial());
}
