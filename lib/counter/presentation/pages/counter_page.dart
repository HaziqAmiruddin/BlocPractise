import 'package:bloc_practise/counter/data/repositories/counter_repository_imp.dart';
import 'package:bloc_practise/counter/domain/usecases/decrement_counter.dart';
import 'package:bloc_practise/counter/domain/usecases/increment_counter.dart';
import 'package:bloc_practise/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_practise/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_practise/counter/presentation/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = CounterRepositoryImp();
    final incrementUseCase = IncrementCounter(repo);
    final decrementUseCase = DecrementCounter(repo);

    return BlocProvider(
      create: (context) => CounterBloc(
        decrementCounter: decrementUseCase,
        incrementCounter: incrementUseCase,
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text("Counter Bloc")),
            body: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    "${state.counter.value}",
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              },
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementEvent()),
                  heroTag: "increment",
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementEvent()),
                  heroTag: "decrement",
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
