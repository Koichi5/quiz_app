import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/quiz_text_controller.dart';

import '../../domain/category/category.dart';
import '../controller/validator/quiz_validator_provider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/quiz_set_button.dart';

class QuizSetScreen extends HookConsumerWidget {
  const QuizSetScreen({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final idControllerProvider = ref.watch(quizIdControllerProvider);
    final titleControllerProvider = ref.watch(quizTitleControllerProvider);
    final descriptionControllerProvider =
        ref.watch(quizDescriptionControllerProvider);
    // final categoryIdControllerProvider =
    //     ref.watch(quizCategoryIdControllerProvider);
    final quizValidator = ref.watch(quizValidatorProvider);
    final quizValidatorNotifier = ref.watch(quizValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("カテゴリ追加"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            // CustomTextField(
            //   title: "クイズID",
            //   controller: idControllerProvider,
            //   error: quizValidator.form.id.errorMessage,
            //   onChanged: (quizId) {
            //     quizValidatorNotifier.setQuizId(quizId);
            //   },
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextField(
              title: "クイズ名",
              controller: titleControllerProvider,
              error: quizValidator.form.title.errorMessage,
              onChanged: (quizTitle) {
                quizValidatorNotifier.setQuizTitle(quizTitle);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextField(
              title: "クイズ詳細",
              controller: descriptionControllerProvider,
              error: quizValidator.form.description.errorMessage,
              onChanged: (quizDescribe) {
                quizValidatorNotifier.setQuizDescription(quizDescribe);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            QuizSetButton(
              title: titleControllerProvider.text,
              description: descriptionControllerProvider.text,
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
