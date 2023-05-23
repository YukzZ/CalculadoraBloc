part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {

  final String result;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  const CalculatorState({
    this.result = '30',
    this.firstNumber = '10',
    this.secondNumber = '20',
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


