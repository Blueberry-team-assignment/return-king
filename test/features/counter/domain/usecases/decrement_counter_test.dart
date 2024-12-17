import 'package:flutter_test/flutter_test.dart';
import 'package:return_king/features/counter/domain/usecases/counter/decrement_counter.dart';

void main() {
  group('IncrementCounter', () {
    test('현재 값이 1감소 할 것', () async {
      final decrementCounter = DecrementCounter();
      final result = await decrementCounter(5);
      expect(result, 4);
    });
    test('0밑으로 안 내려갈 것', () async {
      final decrementCounter = DecrementCounter();
      final result = await decrementCounter(0);
      expect(result, 0);
    });
    test('큰 값도 감소 할 것', () async {
      final decrementCounter = DecrementCounter();
      final result = await decrementCounter(100000);
      expect(result, 99999);
    });
  });
}
