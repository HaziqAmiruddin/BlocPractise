import 'package:bloc_practise/counter/domain/entities/counter.dart';

abstract class CounterRepository {
  Future<Counter> increment(Counter counter);
  Future<Counter> decrement(Counter counter);
}
