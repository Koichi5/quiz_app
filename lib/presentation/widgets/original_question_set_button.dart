import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/validator/option_validator_provider.dart';

import '../controller/original_question_controller.dart';
import '../controller/validator/question_validator_provider.dart';

class OriginalQuestionSetButton extends HookConsumerWidget {
  const OriginalQuestionSetButton(
      {
      required this.text,
      required this.duration,
      Key? key})
      : super(key: key);
  final String text;
  final String duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ref.watch(questionValidatorProvider).form.isValid
                  ? ref.watch(optionValidatorProvider).form.isValid
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.secondary),
          onPressed: ([bool mounted = true]) async {
            if (ref.watch(questionValidatorProvider).form.isValid) {
              if (ref.watch(optionValidatorProvider).form.isValid) {
                final originalQuestion = await ref
                    .watch(originalQuestionControllerProvider.notifier)
                    .addOriginalQuestion(
                      text: text,
                      duration: duration,
                      optionsShuffled: false,
                    );
                if (originalQuestion == null) {
                  if(!mounted) return;
                  showDialog(context: context, builder: (context) {
                    return SimpleDialog(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                              child: Text(
                                "問題を追加できませんでした",
                                textAlign: TextAlign.center,
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("戻る"))
                      ],
                    );
                  });
                }
                if(!mounted) return;
                Navigator.pop(context);
              }
            }
          },
          child: Text(
            "問題登録",
            style: TextStyle(
                color: ref.watch(questionValidatorProvider).form.isValid
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}
