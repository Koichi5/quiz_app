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
    if (category != null) {
      final quizListState = ref.watch(quizControllerProvider(category!));
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ref.watch(currentQuestionIndexProvider.notifier).state = 1;
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
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
                    : ref.watch(questionControllerProvider(quizzes.first)).when(
                          data: (questions) => questions.isEmpty
                              ? const Center(
                                  child: Text("問題が用意されていません"),
                                )
                              : QuizScreen(
                                  reader: ref.watch,
                                  category: category,
                                  quiz: quizzes.first,
                                  questionList: questions),
                          error: (error, _) => Center(
                            child: Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "エラーが発生しています",
                                    textAlign: TextAlign.center,
                                  ),
                                  Lottie.asset("assets/json_files/error.json",
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      fit: BoxFit.fitWidth),
                                ],
                              ),
                            ),
                          ),
                          loading: () => Center(
                            child: Lottie.asset(
                                "assets/json_files/loading.json",
                                width: 200,
                                height: 200),
                          ),
                        ),
                error: (error, _) => Center(
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "エラーが発生しています",
                          textAlign: TextAlign.center,
                        ),
                        Lottie.asset("assets/json_files/error.json",
                            width: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.fitWidth),
                      ],
                    ),
                  ),
                ),
                loading: () => Center(
                  child: Lottie.asset("assets/json_files/loading.json",
                      width: 200, height: 200),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (questionList != null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
              ref.watch(currentQuestionIndexProvider.notifier).state = 1;
            },
          ),
        ),
        body: QuizScreen(
          reader: ref.watch,
          questionList: questionList!,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "エラーが発生しています",
                textAlign: TextAlign.center,
              ),
              Lottie.asset("assets/json_files/error.json",
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.fitWidth),
            ],
          ),
        ),
      );
    }
  }
}
