import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/repository/question_repository.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';

import '../../domain/question/question.dart';

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
                Text(
                  question.options
                      .elementAt(
                        question.options.indexWhere(
                          (element) => element.isCorrect == true,
                        ),
                      )
                      .text,
                ),
                TextButton(
                  onPressed: ([bool mounted = true]) async {
                    await ref
                        .watch(weakQuestionRepositoryProvider)
                        .deleteWeakQuestion(
                          weakQuestionDocRef: question.questionDocRef!,
                        );
                    if (!mounted) return;
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return SimpleDialog(children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  "削除しました",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: ([bool mounted = true]) async {
                                  await ref
                                      .watch(weakQuestionControllerProvider
                                          .notifier)
                                      .retrieveWeakQuestionList();
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                },
                                child: const Text("戻る"))
                          ]);
                        });
                  },
                  child: const Text("覚えた！"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
