part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {

  final String result;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  const CalculatorState({
    this.result = '0',
    this.firstNumber = '0',
    this.secondNumber = '0',
    this.operation = '+',
  });

  copyWith({
    String? result,
    String? firstNumber,
    String? secondNumber,
    String? operation,
  }) => CalculatorState(
    result: result ?? this.result,
    firstNumber: firstNumber ?? this.firstNumber,
    secondNumber: secondNumber ?? this.secondNumber,
    operation: operation ?? this.operation,
  );

  @override
  List<Object> get props => [result, firstNumber, secondNumber, operation];
}


