import 'package:bloc_practise/counter/domain/entities/counter.dart';
import 'package:bloc_practise/counter/domain/repositories/counter_repository.dart';

class DecrementCounter {
  final CounterRepository repository;

  DecrementCounter(this.repository);

  Future<Counter> call(Counter counter) {
    return repository.decrement(counter);
  }
}
