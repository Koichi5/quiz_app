import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/widgets/option_set_button.dart';

import '../controller/option_text_controller.dart';
import '../controller/validator/option_validator_provider.dart';
import '../widgets/custom_text_field.dart';

class OptionSetScreen extends HookConsumerWidget {
  const OptionSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idControllerProvider = ref.watch(optionIdControllerProvider);
    final textControllerProvider = ref.watch(optionTextControllerProvider);
    final optionValidator = ref.watch(optionValidatorProvider);
    final optionValidatorNotifier = ref.watch(optionValidatorProvider.notifier);
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
          CustomTextField(
            title: "選択肢ID",
            controller: idControllerProvider,
            error: optionValidator.form.id.errorMessage,
            onChanged: (optionId) {
              optionValidatorNotifier.setOptionId(optionId);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            title: "選択肢",
            controller: textControllerProvider,
            error: optionValidator.form.text.errorMessage,
            onChanged: (optionText) {
              optionValidatorNotifier.setOptionText(optionText);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          OptionSetButton(
            id: idControllerProvider.text,
            text: textControllerProvider.text,
            isCorrect: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
