import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/question/question.dart';
import '../../domain/repository/weak_question_repository.dart';
import '../controller/weak_question_controller.dart';

final weakQuestionDeleteStateProvider = StateProvider((ref) => false);

class WeakQuestionCard extends HookConsumerWidget {
  const WeakQuestionCard({required this.question, Key? key}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(question.text),
          ),
          collapsed: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("答え"),
          ),
          expanded: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(question.options
                    .elementAt(question.options
                        .indexWhere((element) => element.isCorrect == true))
                    .text),
                TextButton(
                    onPressed: ([bool mounted = true]) async {
                      await ref
                          .watch(weakQuestionControllerProvider.notifier)
                          .deleteWeakQuestion(
                            categoryDocRef: question.categoryDocRef!,
                            quizDocRef: question.quizDocRef!,
                            questionDocRef: question.questionDocRef!,
                          );
                      await ref.watch(weakQuestionScrollListViewProvider.notifier).fetchList();
                      if (!mounted) return;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                    child: Text(
                                      "削除しました \n 再更新時に反映されます",
                                      textAlign: TextAlign.center,
                                    ),),
                              ),
                              TextButton(
                                  onPressed: ([bool mounted = true]) async {
                                    await ref.watch(weakQuestionScrollListViewProvider.notifier).fetchList();
                                    // await ref
                                    //     .watch(
                                    //     weakQuestionControllerProvider
                                    //         .notifier)
                                    //     .retrieveWeakQuestionList();
                                    // if (!mounted) return;
                                    if (!mounted) return;
                                    Navigator.pop(context);
                                  },
                                  child: const Text("戻る"))
                            ]);
                          });
                      // await ref
                      //     .watch(weakQuestionControllerProvider.notifier)
                      //     .retrieveWeakQuestionList();
                    },
                    child: const Text("覚えた！"),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
