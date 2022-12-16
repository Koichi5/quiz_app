import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_list_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/result_question_list_card.dart';

import '../../domain/category/category.dart';
import '../../domain/dto/quiz_result.dart';
import '../../domain/question/question.dart';
import '../controller/category_controller.dart';

class QuizResultScreen extends HookConsumerWidget {
  static const routeName = '/quizResult';
  final Category category;
  final QuizResult result;
  final List<int> takenQuestions;
  final List<bool> answerIsCorrectList;
  const QuizResultScreen(
      {required this.category,
        required this.result,
      required this.takenQuestions,
      required this.answerIsCorrectList,
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
    final totalCorrect = result.totalCorrect;
    final totalQuestions = result.questionList.length;
    final correctAnswerRate = (totalCorrect / totalQuestions * 100).round();
    return Column(
      children: [
        Text(
          "正答率",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "$correctAnswerRate%",
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
            // width: 150,
            // height: 50,
          ),
          TextButton(
              onPressed: () {
                ref.watch(optionGestureProvider.notifier).state = false;
                ref
                    .watch(categoryControllerProvider.notifier)
                    .retrieveCategoryById(
                    quizCategoryDocRef: category.categoryDocRef!)
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuizListScreen(category: value.first)));
                });
              },
              child: Text(
                "再チャレンジ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary),
              )),
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
