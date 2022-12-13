import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/quiz_history/quiz_history.dart';
import '../controller/category_controller.dart';
import '../screens/quiz_list_screen.dart';

class QuizHistoryCard extends HookConsumerWidget {
  const QuizHistoryCard({required this.quizHistory, Key? key})
      : super(key: key);

  final QuizHistory quizHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.98,
      child: Card(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          quizHistory.quizTitle.isEmpty ? "Quiz" : quizHistory.quizTitle,
          style: const TextStyle(fontSize: 24),
        ),
        Text("スコア : ${quizHistory.score} / ${quizHistory.questionCount}",
            style: const TextStyle(
                // color: ThemeHelper.accentColor,
                fontSize: 18)),
        Text((quizHistory.timeTakenMinutes == 0)
            ? "時間 : ${quizHistory.timeTakenSeconds}秒"
            : "時間 : ${quizHistory.timeTakenMinutes}分${quizHistory.timeTakenSeconds}秒"),
        Text(
            "日時 : ${quizHistory.quizDate.month}/${quizHistory.quizDate.day} ${quizHistory.quizDate.hour}:${quizHistory.quizDate.minute}"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              // style: TextButton.styleFrom(
              //   backgroundColor: Theme.of(context).colorScheme.primary
              // ),
              onPressed: () {
                ref
                    .watch(categoryControllerProvider.notifier)
                    .retrieveCategoryById(
                        quizCategoryDocRef: quizHistory.categoryDocRef)
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuizListScreen(category: value.first)));
                });
                // store.getQuizByIdAsync(quizHistory.quizId, quizHistory.categoryId).then((value) {
                //   if (value != null) {
                //     Navigator.pushReplacementNamed(context, QuizScreen.routeName,
                //         arguments: value);
                //   } else {}
                // });
              },
              child: Text(
                "再チャレンジ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
        ),
      ])),
    );
  }
}
