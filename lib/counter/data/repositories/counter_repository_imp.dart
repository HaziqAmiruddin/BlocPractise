import 'package:bloc_practise/counter/domain/entities/counter.dart';
import 'package:bloc_practise/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImp implements CounterRepository {
  @override
  Future<Counter> increment(Counter counter) async {
    return Counter(counter.value + 1);
  }

  @override
  Future<Counter> decrement(Counter counter) async {
    return Counter(counter.value - 1);
  }
}
