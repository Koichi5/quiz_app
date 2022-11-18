import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/quiz_controller.dart';

import '../controller/validator/quiz_validator_provider.dart';

class QuizSetButton extends HookConsumerWidget {
  const QuizSetButton(
      {required this.id,
      required this.title,
      required this.description,
      required this.categoryId,
      Key? key})
      : super(key: key);
  final int id;
  final String title;
  final String description;
  final int categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ref.watch(quizValidatorProvider).form.isValid
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          onPressed: () async {
            if (ref.watch(quizValidatorProvider).form.isValid) {
              await ref.watch(quizControllerProvider.notifier).addQuiz(
                  id: id,
                  title: title,
                  description: description,
                  questionsShuffled: false,
                  imagePath: "",
                  categoryId: categoryId);
              Navigator.pushNamed(context, '/question_set');
            }
          },
          child: const Text("クイズ登録"),
        ),
      ),
    );
  }
}
