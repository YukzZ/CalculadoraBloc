part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {

  final String result;
  final String firstNumber;
  final String secondNumber;
  final String operation;
  final bool isSecondNumber;

  const CalculatorState({
    this.result = '0',
    this.firstNumber = '0',
    this.secondNumber = '0',
    this.operation = '+',
    this.isSecondNumber = false,
  });

  copyWith({
    String? result,
    String? firstNumber,
    String? secondNumber,
    String? operation,
    bool? isSecondNumber,
  }) => CalculatorState(
    result: result ?? this.result,
    firstNumber: firstNumber ?? this.firstNumber,
    secondNumber: secondNumber ?? this.secondNumber,
    operation: operation ?? this.operation,
    isSecondNumber: isSecondNumber ?? this.isSecondNumber,
  );

  @override
  List<Object> get props => [result, firstNumber, secondNumber, operation, isSecondNumber];
}


