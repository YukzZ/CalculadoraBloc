import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<AddNumber>(_onAddNumber);
    on<AddOperator>(_onAddOperator);
    on<CalculateResult>(_onCalculateResult);
    on<Reset>(_onReset);
    on<DeleteNumber>(_onDeleteNumber);
    on<ChangeNegativePositive>(_onChangeNegativePositive);
  }
  void _onAddNumber(AddNumber event, Emitter<CalculatorState> emit){
      if(state.isSecondNumber == false){
        if(event.number == '' && state.firstNumber.contains('.')) return;
        if(state.firstNumber == '0'){
          emit(state.copyWith(
            firstNumber: event.number,
          ));
        } else {
          emit(state.copyWith(
            firstNumber: state.firstNumber + event.number,
          ));
        }
      } else {
        if(event.number == '' && state.secondNumber.contains('.')) return;
        if(state.secondNumber == '0'){
          emit(state.copyWith(
            secondNumber: event.number,
          ));
        } else {
          emit(state.copyWith(
            secondNumber: state.secondNumber + event.number,
          ));
        }
      }
    }

    void _onAddOperator(AddOperator event, Emitter<CalculatorState> emit){
      emit(state.copyWith(
        operation: event.operator,
        isSecondNumber: true,
      ));
    }

    void _onCalculateResult(CalculateResult event, Emitter<CalculatorState> emit){
      final double num1 = double.parse(state.firstNumber);
      final double num2 = double.parse(state.secondNumber);
      double result = 0;

      switch (state.operation){

        case '+':
          result = num1 + num2;
        break;

        case '-':
          result = num1 - num2;
        break;

        case 'X':
          result = num1 * num2;
        break;

        case '/':
          result = num1 / num2;
        break;

      }

      emit(state.copyWith(
        firstNumber: '0',
        secondNumber: '0',
        operation: '+',
        result: result.toString(),
        isSecondNumber: false,
      ));
    }

    void _onReset(Reset event, Emitter<CalculatorState> emit){
      emit(state.copyWith(
        firstNumber: '0',
        secondNumber: '0',
        operation: '+',
        result: '0',
        isSecondNumber: false,
      ));
    }

    void _onDeleteNumber( DeleteNumber event, Emitter<CalculatorState> emit){
      if(state.isSecondNumber == false){
        emit(state.copyWith(
          firstNumber: (state.firstNumber.length > 1)
                      ? state.firstNumber.substring(0, state.firstNumber.length - 1)
                      : '0'
        ));
      } else {
        emit(state.copyWith(
          secondNumber: (state.secondNumber.length > 1)
                      ? state.secondNumber.substring(0, state.secondNumber.length - 1)
                      : '0'
        ));
      }
    }

    void _onChangeNegativePositive(ChangeNegativePositive event, Emitter<CalculatorState> emit){
      if(state.isSecondNumber == false ){
        if(state.firstNumber == '0') return;
        emit(state.copyWith(
          firstNumber: (state.firstNumber.contains('-'))
                      ? state.firstNumber.replaceFirst('-', '')
                      : '-${state.firstNumber}'
        ));
      } else {
        if(state.secondNumber == '0') return;
        emit(state.copyWith(
          secondNumber: (state.secondNumber.contains('-'))
                      ? state.secondNumber.replaceFirst('-', '')
                      : '-${state.secondNumber}'
        ));
      }
    }
}
