import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/counter/domain/usecases/counter/decrement_counter.dart';
import 'package:return_king/features/counter/domain/usecases/counter/increment_counter.dart';

class CounterNotifier extends StateNotifier<int> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;

  CounterNotifier({
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(0);

  Future<void> increment() async {
    state = await incrementCounter(state);
  }

  Future<void> decrement() async {
    state = await decrementCounter(state);
  }
}

// Riverpod Provider 정의
final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(
      incrementCounter: IncrementCounter(),
      decrementCounter: DecrementCounter()),
);
