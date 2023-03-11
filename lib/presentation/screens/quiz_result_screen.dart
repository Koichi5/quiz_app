import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/result_question_list_card.dart';

import '../../domain/dto/quiz_result.dart';
import '../../domain/question/question.dart';
import 'home_screen.dart';

class QuizResultScreen extends HookConsumerWidget {
  static const routeName = '/quizResult';
  final QuizResult result;
  final List<int> takenQuestions;
  final List<bool> answerIsCorrectList;
  final List<Question> questionList;
  QuizResultScreen(
      {required this.result,
      required this.takenQuestions,
      required this.answerIsCorrectList,
      required this.questionList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading:
            questionList.length != answerIsCorrectList.length ? true : false,
      ),
      body: questionList.length != answerIsCorrectList.length
          ? Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "エラーが発生しています\n テスト結果を正確に取得できませんでした",
                    textAlign: TextAlign.center,
                  ),
                  Lottie.asset("assets/json_files/error.json",
                      width: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.fitWidth),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  quizResultInfo(context, result),
                  resultQuestionList(context, result.questionList,
                      takenQuestions, answerIsCorrectList),
                  bottomButtons(context, ref),
                ],
              ),
            ),
    );
  }

  Widget quizResultInfo(BuildContext context, QuizResult result) {
    final double totalCorrect = result.totalCorrect;
    final int totalQuestions = result.questionList.length;
    final int correctAnswerRate = (totalCorrect / totalQuestions * 100).round();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "正答率",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "$correctAnswerRate%",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }

  Widget resultQuestionList(BuildContext context, List<Question> questionList,
      List<int> takenQuestions, List<bool> answerIsCorrectList) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questionList.length,
        itemBuilder: (BuildContext context, int index) {
          final question = questionList[takenQuestions[index]];
          final answerIsCorrect = answerIsCorrectList[index];
          return ResultQuestionListCard(
              question: question, answerIsCorrect: answerIsCorrect);
        });
  }

  Widget bottomButtons(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                ref.watch(currentQuestionIndexProvider.notifier).state = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: (){
                            Navigator.pop(context);
                            ref.watch(currentQuestionIndexProvider.notifier).state = 1;
                          },
                        ),
                        centerTitle: true,
                        title: const Text("再挑戦"),
                      ),
                      body: QuizScreen(
                        questionList: result.questionList,
                        reader: ref.watch,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "再挑戦",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                // Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "終 了",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
