import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/category_controller.dart';
import 'package:quiz_app/presentation/controller/validator/option_validator_provider.dart';

import '../../domain/quiz/quiz.dart';
import '../controller/option_text_controller.dart';
import '../controller/original_question_controller.dart';
import '../controller/question_controller.dart';
import '../controller/validator/question_validator_provider.dart';

class OriginalQuestionSetButton extends HookConsumerWidget {
  const OriginalQuestionSetButton(
      {
      // required this.id,
      required this.text,
      required this.duration,
      Key? key})
      : super(key: key);
  // final String id;
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
          onPressed: () async {
            if (ref.watch(questionValidatorProvider).form.isValid) {
              if (ref.watch(optionValidatorProvider).form.isValid) {
                // final question = Question(id: id, text: text, duration: duration, optionsShuffled: false)
                final originalQuestion = await ref
                    .watch(originalQuestionControllerProvider.notifier)
                    .addOriginalQuestion(
                      text: text,
                      duration: duration,
                      optionsShuffled: false,
                    );
                // if (ref.watch(firstOptionIsCorrectProvider) ||
                //     ref.watch(secondOptionIsCorrectProvider) ||
                //     ref.watch(thirdOptionIsCorrectProvider) ||
                //     ref.watch(fourthOptionIsCorrectProvider)) {
                //   showDialog(context: context, builder: (context) {
                //     return SimpleDialog(
                //       children: [
                //         const Padding(
                //           padding: EdgeInsets.all(10.0),
                //           child: Center(
                //               child: Text(
                //                 "選択肢の正誤が\n 正しくありません",
                //                 textAlign: TextAlign.center,
                //               )),
                //         ),
                //         TextButton(
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //             child: const Text("戻る"))
                //       ],
                //     );
                //   });
                // }
                if (originalQuestion == null) {
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
                // originalQuestion が null の時の処理
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
