import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/option_text_controller.dart';

import '../controller/question_text_controller.dart';
import '../controller/validator/option_validator_provider.dart';
import '../controller/validator/question_validator_provider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/original_question_set_button.dart';

class OriginalQuestionOptionSetScreen extends HookConsumerWidget {
  const OriginalQuestionOptionSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final idControllerProvider = ref.watch(questionIdControllerProvider);
    final textControllerProvider = ref.watch(questionTextControllerProvider);
    // final durationControllerProvider =
    //     ref.watch(questionDurationControllerProvider);
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
        title: const Text("選択肢追加"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: CustomTextField(
              //     title: "問題文",
              //     controller: textControllerProvider,
              //     error: questionValidator.form.text.errorMessage,
              //     onChanged: (questionText) {
              //       questionValidatorNotifier.setQuestionText(questionText);
              //     },
              //     helperText: "問題文を入力してください",
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CustomTextField(
                      title: "選択肢１",
                      controller: ref.watch(firstOptionTextControllerProvider),
                      error: optionValidator.form.text.errorMessage,
                      onChanged: (optionText) {
                        optionValidatorNotifier.setOptionText(optionText);
                      },
                      // helperText: "１つ目の選択肢を入力してください",
                    ),
                  ),
                  Switch(
                      value: ref.watch(firstOptionIsCorrectProvider),
                      onChanged: (value) {
                        ref.watch(firstOptionIsCorrectProvider.notifier).state =
                            value;
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CustomTextField(
                      title: "選択肢２",
                      controller: ref.watch(secondOptionTextControllerProvider),
                      error: optionValidator.form.text.errorMessage,
                      onChanged: (optionText) {
                        optionValidatorNotifier.setOptionText(optionText);
                      },
                      // helperText: "２つ目の選択肢を入力してください",
                    ),
                  ),
                  Switch(
                      value: ref.watch(secondOptionIsCorrectProvider),
                      onChanged: (value) {
                        ref.watch(secondOptionIsCorrectProvider.notifier).state =
                            value;
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CustomTextField(
                      title: "選択肢３",
                      controller: ref.watch(thirdOptionTextControllerProvider),
                      error: optionValidator.form.text.errorMessage,
                      onChanged: (optionText) {
                        optionValidatorNotifier.setOptionText(optionText);
                      },
                      // helperText: "３つ目の選択肢を入力してください",
                    ),
                  ),
                  Switch(
                      value: ref.watch(thirdOptionIsCorrectProvider),
                      onChanged: (value) {
                        ref.watch(thirdOptionIsCorrectProvider.notifier).state =
                            value;
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CustomTextField(
                      title: "選択肢４",
                      controller: ref.watch(fourthOptionTextControllerProvider),
                      error: optionValidator.form.text.errorMessage,
                      onChanged: (optionText) {
                        optionValidatorNotifier.setOptionText(optionText);
                      },
                      // helperText: "４つ目の選択肢を入力してください",
                    ),
                  ),
                  Switch(
                      value: ref.watch(fourthOptionIsCorrectProvider),
                      onChanged: (value) {
                        ref.watch(fourthOptionIsCorrectProvider.notifier).state =
                            value;
                      }),
                ],
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text("選択肢１の正誤"),
              //       Switch(
              //           value: ref.watch(firstOptionIsCorrectProvider),
              //           onChanged: (value) {
              //             ref.watch(firstOptionIsCorrectProvider.notifier).state =
              //                 value;
              //           }),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text("選択肢２の正誤"),
              //       Switch(
              //           value: ref.watch(secondOptionIsCorrectProvider),
              //           onChanged: (value) {
              //             ref.watch(secondOptionIsCorrectProvider.notifier).state =
              //                 value;
              //           }),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text("選択肢３の正誤"),
              //       Switch(
              //           value: ref.watch(thirdOptionIsCorrectProvider),
              //           onChanged: (value) {
              //             ref.watch(thirdOptionIsCorrectProvider.notifier).state =
              //                 value;
              //           }),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text("選択肢４の正誤"),
              //       Switch(
              //           value: ref.watch(fourthOptionIsCorrectProvider),
              //           onChanged: (value) {
              //             ref.watch(fourthOptionIsCorrectProvider.notifier).state =
              //                 value;
              //           }),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              OriginalQuestionSetButton(
                // id: idControllerProvider.text,
                text: textControllerProvider.text,
                // duration: durationControllerProvider.text,
                duration: "10",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
