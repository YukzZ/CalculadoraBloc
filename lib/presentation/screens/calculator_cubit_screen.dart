import 'package:calculadora_flutter/presentation/blocs/calculator_cubit/calculator_cubit.dart';
import 'package:calculadora_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubitScreen extends StatelessWidget {
  const CalculatorCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorCubit(),
      child: const _CalculatorCubitView(),
    );
  }
}

class _CalculatorCubitView extends StatelessWidget {
  const _CalculatorCubitView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculatorCubit>();
    final resultState = context.watch<CalculatorCubit>().state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora Cubit'),
        ),
        body: BlocBuilder<CalculatorCubit, CalculatorState>(
          builder: (context, state) {
            return SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    SubResult(text: state.firstNumber),
                    SubResult(text: state.operation),
                    SubResult(text: state.secondNumber),
                    const LineSeparator(),
                    MainResultText(text: resultState.result),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculatorButton(
                          text: 'AC',
                          bgColor: const Color(0xffA5A5A5),
                          onPressed: () => cubit.reset(),
                        ),
                        CalculatorButton(
                          text: '+/-',
                          bgColor: const Color(0xffA5A5A5),
                          onPressed: () => print('+/-'),
                        ),
                        CalculatorButton(
                          text: 'del',
                          bgColor: const Color(0xffA5A5A5),
                          onPressed: () => print('del'),
                        ),
                        CalculatorButton(
                          text: '/',
                          bgColor: const Color(0xffF0A23B),
                          onPressed: () => cubit.addOperator('/'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculatorButton(
                          text: '7',
                          onPressed: () => cubit.addNumber('7'),
                        ),
                        CalculatorButton(
                          text: '8',
                          onPressed: () => cubit.addNumber('8'),
                        ),
                        CalculatorButton(
                          text: '9',
                          onPressed: () => cubit.addNumber('9'),
                        ),
                        CalculatorButton(
                          text: 'X',
                          bgColor: const Color(0xffF0A23B),
                          onPressed: () => cubit.addOperator('X'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculatorButton(
                          text: '4',
                          onPressed: () => cubit.addNumber('4'),
                        ),
                        CalculatorButton(
                          text: '5',
                          onPressed: () => cubit.addNumber('5'),
                        ),
                        CalculatorButton(
                          text: '6',
                          onPressed: () => cubit.addNumber('6'),
                        ),
                        CalculatorButton(
                          text: '-',
                          bgColor: const Color(0xffF0A23B),
                          onPressed: () => cubit.addOperator('-'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculatorButton(
                          text: '1',
                          onPressed: () => cubit.addNumber('1'),
                        ),
                        CalculatorButton(
                          text: '2',
                          onPressed: () => cubit.addNumber('2'),
                        ),
                        CalculatorButton(
                          text: '3',
                          onPressed: () => cubit.addNumber('3'),
                        ),
                        CalculatorButton(
                          text: '+',
                          bgColor: const Color(0xffF0A23B),
                          onPressed: () => cubit.addOperator('+'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CalculatorButton(
                          text: '0',
                          big: true,
                          onPressed: () => cubit.addNumber('0'),
                        ),
                        CalculatorButton(
                          text: '.',
                          onPressed: () => cubit.addNumber('.'),
                        ),
                        CalculatorButton(
                          text: '=',
                          bgColor: const Color(0xffF0A23B),
                          onPressed: () => cubit.calculateResult(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
