abstract class CounterRepository {
  Future<int> fetchCounter();
  Future<void> saveCounter(int value);
}
