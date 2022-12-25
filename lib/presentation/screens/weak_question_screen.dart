import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/repository/question_repository.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';

import '../../domain/question/question.dart';
import '../widgets/weak_question_card.dart';

class WeakQuestionScreen extends HookConsumerWidget {
  const WeakQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
              future: ref
                  .watch(questionRepositoryProvider)
                  .retrieveWeakQuestionList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Question>> retrievedWeakQuestionList) {
                if (retrievedWeakQuestionList.connectionState !=
                    ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                // エラー発生時はエラーメッセージを表示
                if (retrievedWeakQuestionList.hasError) {
                  return Text(retrievedWeakQuestionList.error.toString());
                }
                // データがnullでないかチェック
                if (retrievedWeakQuestionList.hasData) {
                  // print(retrievedWeakQuestionList);
                  return Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: retrievedWeakQuestionList.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final retrievedWeakQuestion =
                                retrievedWeakQuestionList.data![index];
                            return WeakQuestionCard(
                                question: retrievedWeakQuestion);
                          }),
                      retrievedWeakQuestionList.data!.isEmpty
                          ? Center(child: Lottie.asset("assets/weak_question.json"),)
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Scaffold(
                                              appBar: AppBar(
                                                title: const Text("苦手問題"),
                                                automaticallyImplyLeading:
                                                    false,
                                              ),
                                              body: QuizScreen(
                                                  reader: ref.watch,
                                                  questionList:
                                                      retrievedWeakQuestionList
                                                          .data!),
                                            )));
                              },
                              child: const Text("クイズ"))
                    ],
                  );
                } else {
                  return const Text("苦手問題がありません");
                }
              }),
        ],
      ),
    );
  }
}
