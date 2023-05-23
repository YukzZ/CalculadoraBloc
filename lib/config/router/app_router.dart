import 'package:calculadora_flutter/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubit',
      builder: (context, state) => const CalculatorCubitScreen(),
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => const CalculatorBlocScreen(),
    ),
  ]
);