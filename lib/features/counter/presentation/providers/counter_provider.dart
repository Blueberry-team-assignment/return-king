import 'package:riverpod/riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }

  // Riverpod Provider 정의
}
final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);
