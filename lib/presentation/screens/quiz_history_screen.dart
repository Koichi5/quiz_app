import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/category_controller.dart';
import 'package:quiz_app/presentation/controller/quiz_controller.dart';
import 'package:quiz_app/presentation/controller/quiz_history_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen2.dart';

import '../../domain/quiz_history/quiz_history.dart';

class QuizHistoryScreen extends StatefulWidget {
  static const routeName = '/quizHistory';
  const QuizHistoryScreen({Key? key}) : super(key: key);

  @override
  _QuizHistoryScreenState createState() => _QuizHistoryScreenState();
}

class _QuizHistoryScreenState extends State<QuizHistoryScreen> {
  List<QuizHistory> quizHistoryList = [];
  late Reader reader;
  // late QuizStore store;

  @override
  void initState() {
    // store = QuizStore();
    reader(quizHistoryControllerProvider.notifier)
        .retrieveQuizHistoryList()
        .then((value) => setState(() {
              quizHistoryList = value;
            }));
    // store.loadQuizHistoryAsync().then((value) {
    //   setState(() {
    //     quizHistoryList = value;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz History"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.center,
          // decoration: ThemeHelper.fullScreenBgBoxDecoration(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List<QuizHistory>.from(quizHistoryList)
                        .map(
                          (e) => quizHistoryViewItem(e),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quizHistoryViewItem(QuizHistory quizHistory) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(10),
        // decoration: ThemeHelper.roundBoxDeco(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10),
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
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("Score: ${quizHistory.score}",
                        style: TextStyle(
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
                      reader(categoryControllerProvider.notifier)
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
