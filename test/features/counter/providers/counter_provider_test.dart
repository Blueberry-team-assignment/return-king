import 'package:flutter_test/flutter_test.dart';
import 'package:return_king/features/counter/domain/usecases/decrement_counter.dart';
import 'package:return_king/features/counter/domain/usecases/increment_counter.dart';
import 'package:return_king/features/counter/presentation/providers/counter_provider.dart';

void main() {
  group('CounterNotifier', () {
    late CounterNotifier counterNotifier;
    setUp(() {
      counterNotifier = CounterNotifier(
          incrementCounter: IncrementCounter(),
          decrementCounter: DecrementCounter());
    });
    test('초기 스테이트의 값은 0일 것', () {
      expect(counterNotifier.state, 0);
    });
    test('증가 함수를 실행하면 값은 1일 것', () async {
      await counterNotifier.increment();
      expect(counterNotifier.state, 1);
    });
    test('감소 함수를 실행하면 값은 1일 것', () async {
      await counterNotifier.increment(); // 1
      await counterNotifier.decrement(); // 0
      expect(counterNotifier.state, 0);
    });

    test('초기 스테이트의 값에서(0) 감소 함수를 실행시켜도 값이 0 밑으로 내려가지 않을 것', () async {
      await counterNotifier.decrement(); // 0
      expect(counterNotifier.state, 0);
    });
  });
}
