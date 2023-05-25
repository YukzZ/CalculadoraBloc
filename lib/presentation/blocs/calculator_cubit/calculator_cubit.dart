import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState());

  void addNumber(String number){
    if(state.isSecondNumber == false){
      if (state.firstNumber == '0'){
        emit(state.copyWith(
          firstNumber: number,
        ));
      } else {
        emit(state.copyWith(
          firstNumber: state.firstNumber + number,
        ));
      }
    }else {
      if (state.secondNumber == '0'){
        emit(state.copyWith(
          secondNumber: number,
        ));
      } else {
        emit(state.copyWith(
          secondNumber: state.secondNumber + number,
        ));
      }
    }
  }
  //Dejar los numeros 1 y 2 al dar al boton de igual

  void addOperator(String operator){
    emit(state.copyWith(
        operation: operator,
        isSecondNumber: true,
      ));
      
  }

  void calculateResult(){
    final double num1 = double.parse( state.firstNumber );
    final double num2 = double.parse( state.secondNumber );
    double result = 0;


    switch( state.operation ) {

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
    print(result);
    emit(state.copyWith(
      firstNumber: '0',
      secondNumber: '0',
      operation: '+',
      result: result.toString(),
      isSecondNumber: false,
    ));
  }

  void reset(){
    emit(state.copyWith(
      firstNumber: '0',
      secondNumber: '0',
      operation: '+',
      result: '0',
      isSecondNumber: false
    ));

  }

  void deleteNumber(){
    
  }
}
