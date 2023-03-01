import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/main.dart';

final helloWorldProvider = Provider((ref) => 'Good evening');
final counterProvider = StateProvider((ref) => 0);

class SamplePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int counter = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Column(
            children: [
              Text("$counter", style: const TextStyle(fontSize: 30),),
              ElevatedButton(
                  onPressed: () {
                    ref.watch(counterProvider.notifier).state = counter + 2;
                  },
                  child: const Text("+ 1"))
            ],
          ),
        ),
      ),
    );
  }
}
