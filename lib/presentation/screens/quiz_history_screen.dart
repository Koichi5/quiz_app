import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/quiz_history_controller.dart';

import '../../domain/quiz_history/quiz_history.dart';
import '../widgets/quiz_history_card.dart';

class QuizHistoryScreen extends HookConsumerWidget {
  static const routeName = '/quizHistory';
  const QuizHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: ref
              .watch(quizHistoryControllerProvider.notifier)
              .retrieveQuizHistoryList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<QuizHistory>> quizHistoryList) {
            if (quizHistoryList.connectionState != ConnectionState.done) {
              return Center(
                child: Lottie.asset("assets/loading.json",
                    width: 200, height: 200),
              );
            }
            if (quizHistoryList.hasError) {
              return Text(quizHistoryList.error.toString());
            }
            if (quizHistoryList.hasData) {
              return quizHistoryList.data!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("クイズを解いて実力をつけましょう！"),
                          Lottie.asset(
                            "assets/quiz_history.json",
                            width: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // children: [
                          //   for (int i = 0; i < 10; i++) ...{
                          //     quizHistoryList.data.toList()[i]
                          //   },
                          // ]
                          children: List<QuizHistory>.from(quizHistoryList.data!)
                              .map(
                                (quizHistory) => QuizHistoryCard(
                                  quizHistory: quizHistory,
                                ),
                              )
                              .toList(),
                          ),
                    );
            } else {
              return const Center(child: Text("履歴はまだありません\n クイズに挑戦してみましょう！"));
            }
          }),
    );
  }
}
