import 'package:bloc_practise/counter/domain/entities/counter.dart';
import 'package:bloc_practise/counter/domain/repositories/counter_repository.dart';

class IncrementCounter {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  Future<Counter> call(Counter counter) {
    return repository.increment(counter);
  }
}
