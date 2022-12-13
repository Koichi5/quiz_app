import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          builder: (BuildContext context, AsyncSnapshot quizHistoryList) {
            if (quizHistoryList.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (quizHistoryList.hasError) {
              return Text(quizHistoryList.error.toString());
            }
            if (quizHistoryList.hasData) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List<QuizHistory>.from(quizHistoryList.data)
                      .map(
                        (quizHistory) => QuizHistoryCard(
                          quizHistory: quizHistory,
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return const Center(child: Text("履歴はまだありません"));
            }
          }),
    );
  }
}
