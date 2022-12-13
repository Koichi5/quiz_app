import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/repository/question_repository.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';
import 'package:quiz_app/presentation/controller/weak_question_controller.dart';

import '../../domain/question/question.dart';
import '../widgets/weak_question_card.dart';

class WeakQuestionListScreen extends HookConsumerWidget {
  const WeakQuestionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weakQuestionListState = ref.watch(weakQuestionControllerProvider);
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            weakQuestionListState.when(
                data: (weakQuestionList) => weakQuestionList.isEmpty
                    ? const Center(
                        child: Text('苦手問題はありません'),
                      )
                    : FutureBuilder(
                        future: ref
                            .watch(questionRepositoryProvider)
                            .retrieveWeakQuestionList(
                                weakQuestionList: weakQuestionList),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Question>>
                                retrievedWeakQuestionList) {
                          if (retrievedWeakQuestionList.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          // エラー発生時はエラーメッセージを表示
                          if (retrievedWeakQuestionList.hasError) {
                            return Text(
                                retrievedWeakQuestionList.error.toString());
                          }
                          // データがnullでないかチェック
                          if (retrievedWeakQuestionList.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: retrievedWeakQuestionList.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final retrievedWeakQuestion =
                                      retrievedWeakQuestionList.data![index];
                                  return WeakQuestionCard(
                                      question: retrievedWeakQuestion);
                                });
                          } else {
                            return const Text("苦手問題がありません");
                          }
                        }),
                //                 : ListView.builder(
                //               itemCount: weakQuestionList.length,
                // itemBuilder: (BuildContext context, int index) {
                //   final retrievedWeakQuestionList = await ref.watch(questionRepositoryProvider).retrieveWeakQuestionList(weakQuestionList: weakQuestionList);
                //   final retrievedWeakQuestion = retrievedWeakQuestionList[index];
                //   return WeakQuestionCard();
                // },
                //                     ),
                error: (error, _) => const Text("エラー"),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )),
          ],
        ),
      );
  }
}
