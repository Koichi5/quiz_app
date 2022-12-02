import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen2.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            quizListState.when(
                data: (quizzes) => quizzes.isEmpty
                    ? const Center(
                        child: Material(child: Text("クイズはありません")),
                      )
                    : ref.watch(questionControllerProvider(quizzes.first)).when(
                        data: (questions) => questions.isEmpty
                            ? const Center(
                                child: Text("問題が用意されていません"),
                              )
                            : QuizScreen(quiz: quizzes.first, questionList: questions, reader: ref.read),
                        error: (error, _) => const Text("エラー"),
                        loading: () => const Center(
                              child: CircularProgressIndicator(),
                            )),

                //     : ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: quizzes.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     final quiz = quizzes[index];
                //     return QuizCard(quiz: quiz);
                //   },
                // ),
                error: (error, _) => const Text("エラー"),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))
          ],
        ),
      ),
    );
  }
}
