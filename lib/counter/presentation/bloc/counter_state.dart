import 'package:bloc_practise/counter/domain/entities/counter.dart';

abstract class CounterState {
  final Counter counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial(super.counter);
}

class CounterUpdated extends CounterState {
  CounterUpdated(super.counter);
}
