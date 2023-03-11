import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/validator/category_validator_provider.dart';
import 'package:quiz_app/presentation/screens/quiz_set_screen.dart';

import '../controller/category_controller.dart';

class CategorySetButton extends HookConsumerWidget {
  const CategorySetButton(
      {required this.categoryId,
      required this.name,
      required this.description,
      Key? key})
      : super(key: key);
  final String categoryId;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref, [bool mounted = true]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ref.watch(categoryValidatorProvider).form.isValid
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          onPressed: () async {
            if (ref.watch(categoryValidatorProvider).form.isValid) {
              final category = await ref
                  .watch(categoryControllerProvider.notifier)
                  .addCategory(
                      categoryId: int.parse(categoryId),
                      name: name,
                      description: description,
                      createdAt: DateTime.now());

              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizSetScreen(category: category)));
            }
          },
          child: Text(
            "カテゴリ登録",
            style: TextStyle(
                color: ref.watch(categoryValidatorProvider).form.isValid
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}
