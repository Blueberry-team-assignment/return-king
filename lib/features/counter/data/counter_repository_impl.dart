import 'package:return_king/features/counter/data/firebase_data_source.dart';
import 'package:return_king/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final FirebaseDataSource firebaseDataSource;

  CounterRepositoryImpl(this.firebaseDataSource);

  @override
  Future<int> fetchCounter() {
    throw Exception();
  }

  @override
  Future<void> saveCounter(int value) {
    throw Exception();
  }
}
