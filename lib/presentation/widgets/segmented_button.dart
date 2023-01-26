import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

final currentSelectedIndexProvider = StateProvider((ref) => 0);

class OriginalSegmentedButton extends HookConsumerWidget {
  const OriginalSegmentedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.94,
        child: MaterialSegmentedControl(
          children: _children,
          selectionIndex: ref.watch(currentSelectedIndexProvider),
          selectedColor: Theme.of(context).colorScheme.primary,
          unselectedColor: Theme.of(context).colorScheme.background,
          borderColor: Theme.of(context).colorScheme.tertiary,
          borderRadius: 50,
          verticalOffset: 8.0,
          onSegmentChosen: (int index) {
            ref.watch(currentSelectedIndexProvider.notifier).state = index;
          },
        ),
      ),
    );
  }
}

final Map<int, Widget> _children = {
  0: const Text("苦手問題"),
  1: const Text("履歴"),
};
