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
                child: Lottie.asset("assets/json_files/loading.json",
                    width: 200, height: 200),
              );
            }
            if (quizHistoryList.hasError) {
              return Text(quizHistoryList.error.toString());
            }
            if (quizHistoryList.hasData) {
              if (quizHistoryList.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      const Text("クイズを解いて実力をつけましょう！"),
                      Lottie.asset(
                        "assets/json_files/quiz_history.json",
                        width: MediaQuery.of(context).size.width * 0.7,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: quizHistoryList.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuizHistoryCard(
                            quizHistory: quizHistoryList.data![index]);
                      },
                    ),
                  ),
                );
              }
            } else {
              return const Center(child: Text("履歴はまだありません\n クイズに挑戦してみましょう！"));
            }
          }),
    );
  }
}
