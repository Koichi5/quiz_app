import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/category_text_controller.dart';
import 'package:quiz_app/presentation/controller/validator/category_validator_provider.dart';
import 'package:quiz_app/presentation/widgets/category_set_button.dart';

import '../widgets/custom_text_field.dart';

class CategorySetScreen extends HookConsumerWidget {
  const CategorySetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idControllerProvider = ref.watch(categoryIdControllerProvider);
    final nameControllerProvider = ref.watch(categoryNameControllerProvider);
    final descriptionControllerProvider =
        ref.watch(categoryDescriptionControllerProvider);
    final categoryValidator = ref.watch(categoryValidatorProvider);
    final categoryValidatorNotifier =
        ref.watch(categoryValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("カテゴリ追加"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomTextField(
                title: "カテゴリID",
                controller: idControllerProvider,
                error: categoryValidator.form.id.errorMessage,
                onChanged: (categoryId) {
                  categoryValidatorNotifier.setCategoryId(categoryId);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomTextField(
                title: "カテゴリ名",
                controller: nameControllerProvider,
                error: categoryValidator.form.name.errorMessage,
                onChanged: (categoryName) {
                  categoryValidatorNotifier.setCategoryName(categoryName);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomTextField(
                title: "カテゴリ詳細",
                controller: descriptionControllerProvider,
                error: categoryValidator.form.description.errorMessage,
                onChanged: (categoryDescription) {
                  categoryValidatorNotifier
                      .setCategoryDescription(categoryDescription);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CategorySetButton(
                categoryId: idControllerProvider.text,
                name: nameControllerProvider.text,
                description: descriptionControllerProvider.text),
          ],
        ),
      ),
    );
  }
}
