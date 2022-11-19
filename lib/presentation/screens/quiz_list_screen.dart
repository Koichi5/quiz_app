import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/widgets/category_card.dart';
import 'package:quiz_app/presentation/widgets/quiz_card.dart';

import '../../domain/category/category.dart';
import '../controller/quiz_controller.dart';

class QuizListScreen extends HookConsumerWidget {
  const QuizListScreen({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizListState = ref.watch(quizControllerProvider(category));
    return SingleChildScrollView(
      child: Column(
        children: [
          quizListState.when(
              data: (quizzes) => quizzes.isEmpty
                  ? const Center(
                child: Text("クイズはありません"),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: quizzes.length,
                itemBuilder: (BuildContext context, int index) {
                  final quiz = quizzes[index];
                  return QuizCard(quiz: quiz);
                },
              ),
              error: (error, _) => const Text("エラー"),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ))
        ],
      ),
    );
  }
}
