import 'package:calculadora_flutter/presentation/blocs/calculator_bloc/calculator_bloc.dart';
import 'package:calculadora_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorBlocScreen extends StatelessWidget {
  const CalculatorBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: const BlocCalculatorView(),
    );
  }
}

class BlocCalculatorView extends StatelessWidget {
  const BlocCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Bloc'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric( horizontal: 10 ),
          child: Column(
            children: [
              
              Expanded(
                child: Container(),
              ),

              SubResult( text: context.select((CalculatorBloc calculatorBloc) => calculatorBloc.state.firstNumber) ),
              SubResult( text: context.select((CalculatorBloc calculatorBloc) => calculatorBloc.state.operation) ),
              SubResult( text: context.select((CalculatorBloc calculatorBloc) => calculatorBloc.state.secondNumber) ),
              const LineSeparator(),
              MainResultText( text: context.select((CalculatorBloc calculatorBloc) => calculatorBloc.state.result) ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: 'AC',
                    bgColor: const Color(0xffA5A5A5 ),
                    onPressed: () => context.read<CalculatorBloc>().add(Reset()),
                  ),
                  CalculatorButton( 
                    text: '+/-',
                    bgColor: const Color(0xffA5A5A5 ),
                    onPressed: () => context.read<CalculatorBloc>().add(ChangeNegativePositive()),
                  ),
                  CalculatorButton( 
                    text: 'del',
                    bgColor: const Color(0xffA5A5A5 ),
                    onPressed: () => context.read<CalculatorBloc>().add(DeleteNumber()),
                  ),
                  CalculatorButton( 
                    text: '/',
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => context.read<CalculatorBloc>().add(const AddOperator('/')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '7',
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('7')),
                  ),
                  CalculatorButton( 
                    text: '8',
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('8')),
                  ),
                  CalculatorButton( 
                    text: '9',
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('9')),
                  ),
                  CalculatorButton( 
                    text: 'X',
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => context.read<CalculatorBloc>().add(const AddOperator('X')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '4', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('4')),
                  ),
                  CalculatorButton( 
                    text: '5', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('5')),
                  ),
                  CalculatorButton( 
                    text: '6', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('6')),
                  ),
                  CalculatorButton( 
                    text: '-',
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => context.read<CalculatorBloc>().add(const AddOperator('-')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '1', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('1')),
                  ),
                  CalculatorButton( 
                    text: '2', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('2')),
                  ),
                  CalculatorButton( 
                    text: '3', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('3')),
                  ),
                  CalculatorButton(
                    text: '+',  
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => context.read<CalculatorBloc>().add(const AddOperator('+')),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton( 
                    text: '0', 
                    big: true,
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('0')),
                  ),
                  CalculatorButton( 
                    text: '.', 
                    onPressed: () => context.read<CalculatorBloc>().add(const AddNumber('.')),
                  ),
                  CalculatorButton( 
                    text: '=',
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => context.read<CalculatorBloc>().add(CalculateResult()),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}