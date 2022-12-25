import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';

import '../../domain/category/category.dart';
import '../../domain/question/question.dart';
import '../controller/quiz_controller.dart';

class QuizListScreen extends HookConsumerWidget {
  QuizListScreen({this.category, this.questionList, Key? key})
      : super(key: key);

  Category? category;
  List<Question>? questionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (category != null) {
      final quizListState = ref.watch(quizControllerProvider(category!));
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(category != null ? category!.name : ""),
          ),
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
                      : ref
                          .watch(questionControllerProvider(quizzes.first))
                          .when(
                              data: (questions) => questions.isEmpty
                                  ? const Center(
                                      child: Text("問題が用意されていません"),
                                    )
                                  : QuizScreen(
                                reader: ref.watch,
                                      category: category,
                                      quiz: quizzes.first,
                                      questionList: questions),
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
                  error: (error, _) => const Center(child: Text("エラー")),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ])));
    } else if (questionList != null) {
      return QuizScreen(
        reader: ref.watch,
        questionList: questionList!,
      );
      //     : ListView.builder(
      //   shrinkWrap: true,
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: quizzes.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final quiz = quizzes[index];
      //     return QuizCard(quiz: quiz);
      //   },
      // ),
      // )
    } else {
      return const Scaffold(
        body: Center(
          child: Text("エラーが発生しています"),
        ),
      );
    }
  }
}
