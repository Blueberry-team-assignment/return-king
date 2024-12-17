import 'package:return_king/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  CounterRepositoryImpl();

  @override
  Future<int> fetchCounter() {
    throw Exception();
  }

  @override
  Future<void> saveCounter(int value) {
    throw Exception();
  }
}
