import 'package:flutter_test/flutter_test.dart';
import 'package:return_king/features/counter/domain/usecases/counter/increment_counter.dart';

void main() {
  group('IncrementCounter', () {
    test('기존 값이 1 증가 할 것', () async {
      final incrementCounter = IncrementCounter();
      final result = await incrementCounter(5);
      expect(result, 6);
    });
    test('큰 값도 증가할 것', () async {
      final incrementCounter = IncrementCounter();
      final result = await incrementCounter(99999);
      expect(result, 100000);
    });
  });
}
