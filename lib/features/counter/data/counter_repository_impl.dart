import 'package:return_king/features/counter/data/local_data_source.dart';
import 'package:return_king/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final LocalDataSource localDataSource;

  CounterRepositoryImpl(this.localDataSource);

  @override
  Future<int> fetchCounter() {
    return localDataSource.fetchCounter();
  }

  @override
  Future<void> saveCounter(int value) {
    return localDataSource.saveCounter(value);
  }
}
