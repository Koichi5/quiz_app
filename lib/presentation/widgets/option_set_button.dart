import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/quiz_controller.dart';

import '../controller/validator/option_validator_provider.dart';

class OptionSetButton extends HookConsumerWidget {
  const OptionSetButton({required this.id, required this.text, required this.isCorrect,
    Key? key})
      : super(key: key);
  final String id;
  final String text;
  final bool isCorrect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ref.watch(optionValidatorProvider).form.isValid
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          onPressed: () async {
            if (ref.watch(optionValidatorProvider).form.isValid) {
              await ref.watch(quizControllerProvider.notifier).addOption(
                id: id,
                text: text,
                isCorrect: isCorrect,
              );
              Navigator.pushNamed(context, '/option_set');
            }
          },
          child: const Text("選択肢登録"),
        ),
      ),
    );
  }
}
