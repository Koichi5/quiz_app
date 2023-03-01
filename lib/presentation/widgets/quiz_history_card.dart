import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../domain/quiz_history/quiz_history.dart';
import '../controller/category_controller.dart';
import '../screens/quiz_list_screen.dart';
import '../screens/quiz_screen.dart';

class QuizHistoryCard extends HookConsumerWidget {
  const QuizHistoryCard({required this.quizHistory, Key? key})
      : super(key: key);

  final QuizHistory quizHistory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double correctRate = quizHistory.score / quizHistory.questionCount;
    final int correctRatePercent = (correctRate * 100).round();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.98,
      child: Card(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            quizHistory.quizTitle.isEmpty
                ? "Quiz Title"
                : quizHistory.quizTitle,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 6.0,
                percent: correctRate,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "正答率",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "$correctRatePercent%",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                progressColor: Theme.of(context).colorScheme.primary,
                animation: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.timer),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((quizHistory.timeTakenMinutes == 0)
                            ? "${quizHistory.timeTakenSeconds} 秒"
                            : "${quizHistory.timeTakenMinutes} 分 ${quizHistory.timeTakenSeconds} 秒"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.date_range),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "${quizHistory.quizDate.month} / ${quizHistory.quizDate.day}   ${quizHistory.quizDate.hour} 時 ${quizHistory.quizDate.minute} 分"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: ([bool mounted = true]) async {
                        final category = await ref
                            .watch(categoryControllerProvider.notifier)
                            .retrieveCategoryById(
                                quizCategoryDocRef: quizHistory.categoryDocRef);
                        ref.watch(currentQuestionIndexProvider.notifier).state =
                            1;
                        if (!mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizListScreen(category: category),
                          ),
                        );
                      },
                      child: Text(
                        "再チャレンジ",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ])),
    );
  }
}
