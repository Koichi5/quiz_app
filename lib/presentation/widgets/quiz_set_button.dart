import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/quiz_controller.dart';
import 'package:quiz_app/presentation/screens/question_set_screen.dart';

import '../../domain/category/category.dart';
import '../controller/validator/quiz_validator_provider.dart';

class QuizSetButton extends HookConsumerWidget {
  const QuizSetButton(
      {required this.title,
      required this.description,
      required this.category,
      Key? key})
      : super(key: key);
  final String title;
  final String description;
  final Category category;

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
          onPressed: ([bool mounted = true]) async {
            if (ref.watch(quizValidatorProvider).form.isValid) {
              final quiz = await ref
                  .watch(quizControllerProvider(category).notifier)
                  .addQuiz(
                      category: category,
                      title: title,
                      description: description,
                      questionsShuffled: false,
                      imagePath: "",
                      categoryId: category.categoryId);
              if (!mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionSetScreen(
                    quiz: quiz,
                  ),
                ),
              );
            }
          },
          child: Text(
            "クイズ登録",
            style: TextStyle(
                color: ref.watch(quizValidatorProvider).form.isValid
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}
