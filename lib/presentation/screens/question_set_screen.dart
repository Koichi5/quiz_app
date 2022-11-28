import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/option_text_controller.dart';
import 'package:quiz_app/presentation/widgets/question_set_button.dart';

import '../../domain/quiz/quiz.dart';
import '../controller/question_text_controller.dart';
import '../controller/validator/option_validator_provider.dart';
import '../controller/validator/question_validator_provider.dart';
import '../widgets/custom_text_field.dart';

class QuestionSetScreen extends HookConsumerWidget {
  const QuestionSetScreen({required this.quiz, Key? key}) : super(key: key);

  final Quiz quiz;
  // final Reader _reader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idControllerProvider = ref.watch(questionIdControllerProvider);
    final textControllerProvider = ref.watch(questionTextControllerProvider);
    final durationControllerProvider =
        ref.watch(questionDurationControllerProvider);
    final questionValidator = ref.watch(questionValidatorProvider);
    final questionValidatorNotifier =
        ref.watch(questionValidatorProvider.notifier);
    // options
    // final firstOptionTextController = ref.watch(firstOptionTextControllerProvider);
    // final secondOptionTextController = ref.watch(secondOptionTextControllerProvider);
    // final thirdOptionTextController = ref.watch(thirdOptionTextControllerProvider);
    // final fourthOptionTextController = ref.watch(fourthOptionTextControllerProvider);
    final optionValidator = ref.watch(optionValidatorProvider);
    final optionValidatorNotifier = ref.watch(optionValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("問題追加"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
                  questionValidatorNotifier
                      .setQuestionDuration(questionDuration);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                title: "選択肢１",
                controller: ref.watch(firstOptionTextControllerProvider),
                error: optionValidator.form.text.errorMessage,
                onChanged: (optionText) {
                  optionValidatorNotifier.setOptionText(optionText);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Switch(
                  value: ref.watch(firstOptionIsCorrectProvider),
                  onChanged: (value) {
                    ref.watch(firstOptionIsCorrectProvider.notifier).state =
                        value;
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                title: "選択肢２",
                controller: ref.watch(secondOptionTextControllerProvider),
                error: optionValidator.form.text.errorMessage,
                onChanged: (optionText) {
                  optionValidatorNotifier.setOptionText(optionText);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Switch(
                  value: ref.watch(secondOptionIsCorrectProvider),
                  onChanged: (value) {
                    ref.watch(secondOptionIsCorrectProvider.notifier).state =
                        value;
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                title: "選択肢３",
                controller: ref.watch(thirdOptionTextControllerProvider),
                error: optionValidator.form.text.errorMessage,
                onChanged: (optionText) {
                  optionValidatorNotifier.setOptionText(optionText);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Switch(
                  value: ref.watch(thirdOptionIsCorrectProvider),
                  onChanged: (value) {
                    ref.watch(thirdOptionIsCorrectProvider.notifier).state =
                        value;
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextField(
                title: "選択肢４",
                controller: ref.watch(fourthOptionTextControllerProvider),
                error: optionValidator.form.text.errorMessage,
                onChanged: (optionText) {
                  optionValidatorNotifier.setOptionText(optionText);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Switch(
                  value: ref.watch(fourthOptionIsCorrectProvider),
                  onChanged: (value) {
                    ref.watch(fourthOptionIsCorrectProvider.notifier).state =
                        value;
                  }),
              QuestionSetButton(
                // id: idControllerProvider.text,
                text: textControllerProvider.text,
                duration: durationControllerProvider.text,
                firstOptionText: ref.watch(firstOptionTextControllerProvider).text,
                firstOptionIsCorrect: ref.watch(firstOptionIsCorrectProvider),
                secondOptionText: ref.watch(secondOptionTextControllerProvider).text,
                secondOptionIsCorrect: ref.watch(secondOptionIsCorrectProvider),
                thirdOptionText: ref.watch(thirdOptionTextControllerProvider).text,
                thirdOptionIsCorrect: ref.watch(thirdOptionIsCorrectProvider),
                fourthOptionText: ref.watch(fourthOptionTextControllerProvider).text,
                fourthOptionIsCorrect: ref.watch(fourthOptionIsCorrectProvider),
                quiz: quiz,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
