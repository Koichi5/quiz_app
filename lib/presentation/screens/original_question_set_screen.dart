import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/original_question_option_set_screen.dart';

import '../controller/question_text_controller.dart';
import '../controller/validator/question_validator_provider.dart';
import '../widgets/custom_text_field.dart';

class OriginalQuestionSetScreen extends HookConsumerWidget {
  const OriginalQuestionSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textControllerProvider = ref.watch(questionTextControllerProvider);
    final questionValidator = ref.watch(questionValidatorProvider);
    final questionValidatorNotifier =
        ref.watch(questionValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("問題文設定"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: CustomTextField(
              title: "問題文",
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              controller: textControllerProvider,
              error: questionValidator.form.text.errorMessage,
              onChanged: (questionText) {
                questionValidatorNotifier.setQuestionText(questionText);
              },
              helperText: "問題文を入力してください",
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const OriginalQuestionOptionSetScreen()));
              },
              child: const Text("選択肢設定へ"))
        ],
      ),
    );
  }
}
