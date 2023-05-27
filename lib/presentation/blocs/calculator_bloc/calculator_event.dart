part of 'calculator_bloc.dart';

abstract class CalculatorEvent {
  const CalculatorEvent();

  // @override
  // List<Object> get props => [];
}

class AddNumber extends CalculatorEvent{
  final String number;

  const AddNumber(this.number);
}

class AddOperator extends CalculatorEvent{
  final String operator;

  const AddOperator(this.operator);
}

class CalculateResult extends CalculatorEvent{}

class Reset extends CalculatorEvent{}

class DeleteNumber extends CalculatorEvent{}

class ChangeNegativePositive extends CalculatorEvent{}

class SelectFirstNumber extends CalculatorEvent{}

class SelectSecondNumber extends CalculatorEvent{}
