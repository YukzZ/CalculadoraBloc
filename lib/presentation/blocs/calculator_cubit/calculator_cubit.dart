import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState());

  void addNumber(String number){
    if (state.firstNumber == '0'){
      emit(state.copyWith(
        firstNumber: number,
      ));
    } else {
      emit(state.copyWith(
        firstNumber: state.firstNumber + number,
      ));
    }
  }
}
