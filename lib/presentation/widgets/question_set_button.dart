import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/question/question.dart';
import 'package:quiz_app/presentation/controller/quiz_controller.dart';
import 'package:quiz_app/presentation/screens/option_set_screen.dart';

import '../../domain/quiz/quiz.dart';
import '../controller/question_controller.dart';
import '../controller/validator/question_validator_provider.dart';

class QuestionSetButton extends HookConsumerWidget {
  const QuestionSetButton(
      {
      // required this.id,
      required this.text,
      required this.duration,
      required this.firstOptionText,
      required this.firstOptionIsCorrect,
      required this.secondOptionText,
      required this.secondOptionIsCorrect,
      required this.thirdOptionText,
      required this.thirdOptionIsCorrect,
      required this.fourthOptionText,
      required this.fourthOptionIsCorrect,
      required this.quiz,
      Key? key})
      : super(key: key);
  // final String id;
  final String text;
  final String duration;
  final String firstOptionText;
  final bool firstOptionIsCorrect;
  final String secondOptionText;
  final bool secondOptionIsCorrect;
  final String thirdOptionText;
  final bool thirdOptionIsCorrect;
  final String fourthOptionText;
  final bool fourthOptionIsCorrect;
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
              final question = await ref
                  .watch(questionControllerProvider(quiz).notifier)
                  .addQuestion(
                    // id: id,
                    text: text,
                    duration: int.parse(duration),
                    firstOptionText: firstOptionText,
                    firstOptionIsCorrect: firstOptionIsCorrect,
                    secondOptionText: secondOptionText,
                    secondOptionIsCorrect: secondOptionIsCorrect,
                    thirdOptionText: thirdOptionText,
                    thirdOptionIsCorrect: thirdOptionIsCorrect,
                    fourthOptionText: fourthOptionText,
                    fourthOptionIsCorrect: fourthOptionIsCorrect,
                    optionsShuffled: false,
                    quiz: quiz,
                  );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             OptionSetScreen(question: question)));
              // Navigator.pushNamed(context, '/option_set');
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
