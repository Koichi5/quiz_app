import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/category_controller.dart';

import '../../domain/quiz/quiz.dart';
import '../controller/question_controller.dart';
import '../controller/validator/question_validator_provider.dart';

class QuestionSetButton extends HookConsumerWidget {
  const QuestionSetButton(
      {
      // required this.id,
      required this.text,
      required this.duration,
      required this.quiz,
      Key? key})
      : super(key: key);
  // final String id;
  final String text;
  final String duration;
  final Quiz quiz;

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
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          onPressed: () async {
            if (ref.watch(questionValidatorProvider).form.isValid) {
              // final question = Question(id: id, text: text, duration: duration, optionsShuffled: false)
              await ref
                  .watch(questionControllerProvider(quiz).notifier)
                  .addQuestion(
                    // id: id,
                    text: text,
                    duration: duration,
                    optionsShuffled: false,
                    quiz: quiz,
                  );
              ref.watch(categoryQuestionCountProvider.notifier).state++;
              ref
                  .watch(categoryControllerProvider.notifier)
                  .editCategoryQuestionCount(
                      categoryQuestionCount:
                          ref.watch(categoryQuestionCountProvider),
                      categoryDocRef: quiz.categoryDocRef!);
              Navigator.pop(context);
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
