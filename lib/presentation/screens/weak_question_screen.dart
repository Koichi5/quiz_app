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
                  return Center(
                    child: Lottie.asset("assets/json_files/loading.json",
                        width: 200, height: 200),
                  );
                }
                // エラー発生時はエラーメッセージを表示
                if (retrievedWeakQuestionList.hasError) {
                  return Text(retrievedWeakQuestionList.error.toString());
                }
                // データがnullでないかチェック
                if (retrievedWeakQuestionList.hasData) {
                  // print(retrievedWeakQuestionList);
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                                  const Text("苦手問題を登録して復習しましょう！"),
                                  Lottie.asset("assets/weak_question.json",
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Scaffold(
                                              appBar: AppBar(
                                                title: const Text("苦手問題"),
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
