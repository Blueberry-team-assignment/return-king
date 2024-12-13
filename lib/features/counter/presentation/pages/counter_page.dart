import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/counter/presentation/providers/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final counterNotifier = ref.read(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed the button this many times:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            // 동적 상태를 반영하므로 const 사용 불가
            '$counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: counterNotifier.decrement, child: const Text('-')),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: counterNotifier.increment, child: const Text('+'))
            ],
          )
        ],
      )),
    );
  }
}
