import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/question/question.dart';
import 'package:quiz_app/domain/repository/question_repository.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';

class ResultQuestionListCard extends HookConsumerWidget {
  const ResultQuestionListCard(
      {required this.question, required this.answerIsCorrect, Key? key})
      : super(key: key);
  final Question question;
  final bool answerIsCorrect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weakQuestionsState = ref.watch(weakQuestionControllerProvider);
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            answerIsCorrect
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.circle_outlined,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    question.options.elementAt(question.options.indexWhere((element) => element.isCorrect == true)).text,
                  ),
                ),
              ],
            ),
          ]
              ),
          weakQuestionsState.when(
              data: (weakQuestionList) {
                return weakQuestionList.any((element) =>
                        element.questionDocRef == question.questionDocRef)
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check_box_outlined))
                    : IconButton(
                        onPressed: ([bool mounted = true]) async {
                          if (question.categoryDocRef == null) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Text(
                                            "オリジナル問題は追加できません",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("戻る"),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            await ref
                                .watch(weakQuestionControllerProvider.notifier)
                                .addWeakQuestion(question: question);
                            if (!mounted) return;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "追加しました",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: ([bool mounted = true]) async {
                                        await ref
                                            .watch(
                                                weakQuestionRepositoryProvider)
                                            .retrieveWeakQuestionList();
                                        if (!mounted) return;
                                        Navigator.pop(context);
                                      },
                                      child: const Text("戻る"),
                                    ),
                                  ]);
                                });
                          }
                        },
                        icon: const Icon(Icons.check_box_outline_blank),
                      );
              },
              error: (error, _) => Center(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "エラーが発生しています",
                        textAlign: TextAlign.center,
                      ),
                      Lottie.asset("assets/json_files/error.json",
                          width: MediaQuery.of(context).size.width * 0.7,
                          fit: BoxFit.fitWidth),
                    ],
                  ),
                ),
              ),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
