import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/category_controller.dart';
import 'package:quiz_app/presentation/controller/quiz_controller.dart';
import 'package:quiz_app/presentation/controller/quiz_history_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen2.dart';

import '../../domain/quiz_history/quiz_history.dart';

class QuizHistoryScreen extends HookConsumerWidget {
  static const routeName = '/quizHistory';
  const QuizHistoryScreen({Key? key}) : super(key: key);
//
//   @override
//   _QuizHistoryScreenState createState() => _QuizHistoryScreenState();
// }
//
// class _QuizHistoryScreenState extends ConsumerState<QuizHistoryScreen> {
//   List<QuizHistory> quizHistoryList = [];
  // late QuizStore store;

  // @override
  // void initState() {
  //   super.initState();
  //   // store = QuizStore();
  //   ref.watch(quizHistoryControllerProvider.notifier)
  //       .retrieveQuizHistoryList()
  //       .then((value) => setState(() {
  //             quizHistoryList = value;
  //           }));
  //   // store.loadQuizHistoryAsync().then((value) {
  //   //   setState(() {
  //   //     quizHistoryList = value;
  //   //   });
  //   // });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz History"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        // decoration: ThemeHelper.fullScreenBgBoxDecoration(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: ref
                        .watch(quizHistoryControllerProvider.notifier)
                        .retrieveQuizHistoryList(),
                    builder:
                        (BuildContext context, AsyncSnapshot quizHistoryList) {
                      if (quizHistoryList.connectionState !=
                          ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (quizHistoryList.hasError) {
                        return Text(quizHistoryList.error.toString());
                      }
                      if (quizHistoryList.hasData) {
                        return Column(
                          children: List<QuizHistory>.from(quizHistoryList.data)
                              .map(
                                (quizHistory) => quizHistoryViewItem(
                                    context, ref, quizHistory),
                              )
                              .toList(),
                        );
                      } else {
                        return const Text("履歴はまだありません");
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quizHistoryViewItem(
      BuildContext context, WidgetRef ref, QuizHistory quizHistory) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(10),
        // decoration: ThemeHelper.roundBoxDeco(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 115,
                width: 10,
                child: Container(
                    // decoration: ThemeHelper.roundBoxDeco(color: ThemeHelper.primaryColor, radius: 10),
                    ),
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quizHistory.quizTitle.isEmpty
                          ? "Question"
                          : quizHistory.quizTitle,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text("Score: ${quizHistory.score}",
                        style: const TextStyle(
                            // color: ThemeHelper.accentColor,
                            fontSize: 18)),
                    Text("Time Taken: ${quizHistory.timeTaken}"),
                    Text(
                        "Date: ${quizHistory.quizDate.year}-${quizHistory.quizDate.month}-${quizHistory.quizDate.day} ${quizHistory.quizDate.hour}:${quizHistory.quizDate.minute}"),
                  ]),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .watch(categoryControllerProvider.notifier)
                          .retrieveCategoryById(
                              quizCategoryDocRef: quizHistory.categoryDocRef)
                          .then((value) {
                        if (value != null) {
                          Navigator.pushReplacementNamed(
                              context, QuizScreen.routeName,
                              arguments: value);
                        }
                      });
                      // store.getQuizByIdAsync(quizHistory.quizId, quizHistory.categoryId).then((value) {
                      //   if (value != null) {
                      //     Navigator.pushReplacementNamed(context, QuizScreen.routeName,
                      //         arguments: value);
                      //   } else {}
                      // });
                    },
                    child: const Text("Start Again")),
              ],
            )
          ],
        ));
  }
}
