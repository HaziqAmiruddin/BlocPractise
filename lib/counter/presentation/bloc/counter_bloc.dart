import 'package:bloc_practise/counter/domain/entities/counter.dart';
import 'package:bloc_practise/counter/domain/usecases/decrement_counter.dart';
import 'package:bloc_practise/counter/domain/usecases/increment_counter.dart';
import 'package:bloc_practise/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_practise/counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;

  CounterBloc({required this.decrementCounter, required this.incrementCounter})
    : super(CounterInitial(Counter(0))) {
    on<IncrementEvent>((event, emit) async {
      final updated = await incrementCounter(state.counter);
      emit(CounterUpdated(updated));
    });

    on<DecrementEvent>((event, emit) async {
      final updated = await decrementCounter(state.counter);
      emit(CounterUpdated(updated));
    });
  }
}
