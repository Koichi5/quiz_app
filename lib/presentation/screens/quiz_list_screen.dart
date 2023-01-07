import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';

import '../../domain/category/category.dart';
import '../../domain/question/question.dart';
import '../../domain/quiz/quiz.dart';
import '../controller/quiz_controller.dart';

class QuizListScreen extends HookConsumerWidget {
  QuizListScreen({this.category, this.questionList, this.quizList, Key? key})
      : super(key: key);

  Category? category;
  List<Question>? questionList;
  List<Quiz>? quizList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(quizList);
    // if (quizList != null && category != null) {
    //   print("quizList と category あります");
    //   final questionListState =
    //       ref.watch(questionControllerProvider(quizList!.first));
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text(category!.name),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           questionListState.when(
    //             data: (questions) => questions.isEmpty
    //                 ? const Center(
    //                     child: Text("問題が用意されていません"),
    //                   )
    //                 : QuizScreen(
    //                     reader: ref.watch,
    //                     category: category,
    //                     questionList: questions),
    //             error: (error, _) => const Text("エラー"),
    //             loading: () => Center(
    //               child: Lottie.asset("assets/json_files/loading.json",
    //                   width: 200, height: 200),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );

    if (category != null) {
      final quizListState = ref.watch(quizControllerProvider(category!));
      return Scaffold(
          appBar: AppBar(
            title: Text(category!.name),
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
                              loading: () => Center(
                                    child: Lottie.asset("assets/json_files/loading.json",
                                        width: 200, height: 200),
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
                  loading: () => Center(
                    child: Lottie.asset("assets/json_files/loading.json",
                        width: 200, height: 200),
                  ),
                )
              ])));
    } else if (questionList != null) {
      return Scaffold(
        appBar: AppBar(),
        body: QuizScreen(
          reader: ref.watch,
          questionList: questionList!,
        ),
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
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("エラーが発生しています"),
        ),
      );
    }
  }
}
