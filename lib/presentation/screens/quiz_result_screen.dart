import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  // int totalQuestions = 0;
  // double totalCorrect = 0;

  // @override
  // void initState() {
  //   setState(() {
  //     totalCorrect = result.totalCorrect;
  //     totalQuestions = result.questionList.length;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text("結果"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            quizResultInfo(context, result),
            resultQuestionList(context, result.questionList, takenQuestions,
                answerIsCorrectList),
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
          // if (index > questionList.length) {
          //   showDialog(context: context, builder: (context) {
          //     print("エラーが発生しています");
          //     return const SimpleDialog(title: Text("エラーが発生しています"),);
          //   });
          // }
          // print("questionList[takenQuestions[index]] : ${questionList[takenQuestions[index]]}");
          // print(index);
          // print("answerIsCorrectList[index] : ${answerIsCorrectList[index]}");
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              // Navigator.pop(context);
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
            // width: 150,
            // height: 50,
          ),
          // category != null ?
          TextButton(
              onPressed: ([bool mounted = true]) {
                // ref.watch(optionGestureProvider.notifier).state = false;
                // ref
                //     .watch(categoryControllerProvider.notifier)
                //     .retrieveCategoryById(
                //     quizCategoryDocRef: category!.categoryDocRef!)
                //     .then((value) {
                if (!mounted) return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: const Text("再挑戦"),
                            ),
                            body: QuizScreen(
                              questionList: result.questionList,
                              reader: ref.watch,
                            ))));
              },
              child: Text(
                "再チャレンジ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ))
          // : const SizedBox(),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //         context, MaterialPageRoute(builder: (context) => const QuizHistoryScreen()));
          //   },
          //   child: const Text(
          //     "History",
          //     style: TextStyle(color: Colors.white, fontSize: 20),
          //   ),
          // ),
        ],
      ),
    );
  }
}
