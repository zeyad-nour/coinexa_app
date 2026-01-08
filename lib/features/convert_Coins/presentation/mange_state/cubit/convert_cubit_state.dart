part of 'convert_cubit_cubit.dart';




sealed class ConvertCubitState {}

final class ConvertCubitInitial extends ConvertCubitState {}
class ConvertLoading extends ConvertCubitState {}

class ConvertSuccess extends ConvertCubitState {
  final double result;

  ConvertSuccess(this.result);
}

class ConvertFailure extends ConvertCubitState {
  final String error;

  ConvertFailure(this.error);
}
