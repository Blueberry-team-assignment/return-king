import 'package:flutter_test/flutter_test.dart';
import 'package:return_king/features/counter/domain/entities/counter.dart';

void main() {
  group('Counter', () {
    test('should increment the counter value by 1', () {
      final counter = Counter(0);
      final incrementCounter = counter.increment();
      expect(incrementCounter.value, 1);
    });
    test('should decrement the counter value by 1', () {
      final counter = Counter(1);
      final decrementedCounter = counter.decrement();
      expect(decrementedCounter.value, 0);
    });
    test('should not decrement the counter value below 0', () {
      final counter = Counter(0);
      final decrementedCounter = counter.decrement();
      expect(decrementedCounter.value, 0);
    });
  });
}
