import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/widgets/question_set_button.dart';

import '../../domain/quiz/quiz.dart';
import '../controller/question_text_controller.dart';
import '../controller/validator/question_validator_provider.dart';
import '../widgets/custom_text_field.dart';

class QuestionSetScreen extends HookConsumerWidget {
  const QuestionSetScreen({required this.quiz, Key? key}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idControllerProvider = ref.watch(questionIdControllerProvider);
    final textControllerProvider = ref.watch(questionTextControllerProvider);
    final durationControllerProvider =
        ref.watch(questionDurationControllerProvider);
    final questionValidator = ref.watch(questionValidatorProvider);
    final questionValidatorNotifier =
        ref.watch(questionValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("問題追加"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          // CustomTextField(
          //   title: "問題ID",
          //   controller: idControllerProvider,
          //   error: questionValidator.form.id.errorMessage,
          //   onChanged: (questionId) {
          //     questionValidatorNotifier.setQuestionId(questionId);
          //   },
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            title: "問題文",
            controller: textControllerProvider,
            error: questionValidator.form.text.errorMessage,
            onChanged: (questionText) {
              questionValidatorNotifier.setQuestionText(questionText);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            title: "制限時間",
            controller: durationControllerProvider,
            error: questionValidator.form.duration.errorMessage,
            onChanged: (questionDuration) {
              questionValidatorNotifier.setQuestionDuration(questionDuration);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          QuestionSetButton(
              // id: idControllerProvider.text,
              text: textControllerProvider.text,
              duration: durationControllerProvider.text,
            quiz: quiz,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
