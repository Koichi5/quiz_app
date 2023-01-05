import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/question/question.dart';
import 'package:quiz_app/domain/weak_question/weak_question.dart';
import 'package:quiz_app/presentation/controller/weak_question_controller.dart';

// final questionIsRegisteredWeakQuestionProvider = StateProvider((ref) => false);
// final weakQuestionToggleProvider = StateProvider((ref) => false);

class ResultQuestionListCard extends HookConsumerWidget {
  const ResultQuestionListCard(
      {required this.question, required this.answerIsCorrect, Key? key})
      : super(key: key);
  final Question question;
  final bool answerIsCorrect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  padding: const EdgeInsets.all(10.0),
                  child: Text(question.text),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 10.0),
                  child: Text(
                      "答え : ${question.options.elementAt(question.options.indexWhere((element) => element.isCorrect == true)).text}"),
                ),
              ],
            ),
            // TextButton(
            //     onPressed: ref.watch(weakQuestionToggleProvider) ? (){} : (){
            //       ref.watch(weakQuestionToggleProvider.notifier).state = true;
            //       ref
            //           .watch(weakQuestionControllerProvider.notifier)
            //           .addWeakQuestion(
            //           quizDocRef: question.quizDocRef!,
            //           categoryDocRef: question.categoryDocRef!,
            //           questionDocRef: question.questionDocRef!);
            //     },
            //     child: const Text("苦手"))
            // IconButton(
            //     onPressed: () async {
            //       ref
            //               .watch(questionIsRegisteredWeakQuestionProvider.notifier)
            //               .state =
            //           await ref
            //               .watch(weakQuestionControllerProvider.notifier)
            //               .retrieveWeakQuestionList()
            //               .then((retrievedWeakQuestionList) =>
            //                   retrievedWeakQuestionList.contains(WeakQuestion(
            //                       categoryDocRef: question.categoryDocRef!,
            //                       quizDocRef: question.quizDocRef!,
            //                       questionDocRef: question.questionDocRef!)));
            //       ref.watch(questionIsRegisteredWeakQuestionProvider)
            //           ? () {
            //               ref
            //                   .watch(weakQuestionControllerProvider.notifier)
            //                   .deleteWeakQuestion(
            //                       quizDocRef: question.quizDocRef!,
            //                       categoryDocRef: question.categoryDocRef!,
            //                       questionDocRef: question.questionDocRef!);
            //             }
            //           : () {
            //               ref
            //                   .watch(weakQuestionControllerProvider.notifier)
            //                   .addWeakQuestion(
            //                       quizDocRef: question.quizDocRef!,
            //                       categoryDocRef: question.categoryDocRef!,
            //                       questionDocRef: question.questionDocRef!);
            //             };
            //     },
            //     icon: Icon(ref.watch(questionIsRegisteredWeakQuestionProvider)
            //         ? Icons.check_box_outlined
            //         : Icons.check_box_outline_blank))
          ]
              // icon: ref.watch(weakQuestionControllerProvider.notifier).retrieveWeakQuestionList().then((retrievedWeakQuestionList) => retrievedWeakQuestionList.forEach((retrievedWeakQuestion) { retrievedWeakQuestion.questionDocRef == question.questionDocRef ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_outline_blank) }))
              //           icon:                 ref
              //     .watch(weakQuestionControllerProvider.notifier)
              //     .retrieveWeakQuestionList()
              //     .then((retrievedWeakQuestionList) =>
              // retrievedWeakQuestionList
              //     .forEach((retrievedWeakQuestion) {
              // retrievedWeakQuestion.questionDocRef ==
              // question.questionDocRef}) ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_outline_blank),
              //       ),
              //       Icon(Icons.check_box_outline_blank),
              //       Icon(Icons.check_box_outlined),
              //     ],
              ),
          FutureBuilder(
              future: ref
                  .watch(weakQuestionControllerProvider.notifier)
                  .retrieveWeakQuestionList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<WeakQuestion>> weakQuestionList) {
                if (weakQuestionList.connectionState != ConnectionState.done) {
                  // return Center(child: Lottie.asset("assets/json_files/loading.json", width: 200, height: 200),);
                  return const SizedBox();
                }
                // エラー発生時はエラーメッセージを表示
                if (weakQuestionList.hasError) {
                  return Text(weakQuestionList.error.toString());
                }
                // データがnullでないかチェック
                if (weakQuestionList.hasData) {
                  // if (weakQuestionList.data!.isEmpty) {
                  //   return const Text("エラーです");
                  // } else {
                  return weakQuestionList.data!.any((element) =>
                          element.questionDocRef == question.questionDocRef)
                      // return snapshot.data!.contains(WeakQuestion(
                      //         categoryDocRef: question.categoryDocRef!,
                      //         quizDocRef: question.quizDocRef!,
                      //         questionDocRef: question.questionDocRef!,
                      // ))
                      //   return snapshot.data!.then((retrievedWeakQuestionList) => retrievedWeakQuestionList.forEach((e) => e.questionDocRef == question.questionDocRef))
                      ? IconButton(
                          onPressed: ()
                              // async
                              {
                            // print(weakQuestionList.data!.contains(WeakQuestion(
                            //     categoryDocRef: question.categoryDocRef!,
                            //     quizDocRef: question.quizDocRef!,
                            //     questionDocRef: question.questionDocRef!)));
                            // print(snapshot.data!.map((e) =>
                            //     e.questionDocRef == question.questionDocRef));
                            // await ref
                            //     .watch(weakQuestionControllerProvider.notifier)
                            //     .deleteWeakQuestion(
                            //   categoryDocRef: question.categoryDocRef!,
                            //   quizDocRef: question.quizDocRef!,
                            //   questionDocRef: question.questionDocRef!,
                            // );
                            // ref.watch(weakQuestionControllerProvider);
                          },
                          icon: const Icon(Icons.check_box_outlined))
                      : IconButton(
                          onPressed: () async {
                            print(weakQuestionList.data!.contains(WeakQuestion(
                                categoryDocRef: question.categoryDocRef!,
                                quizDocRef: question.quizDocRef!,
                                questionDocRef: question.questionDocRef!)));
                            await ref
                                .watch(weakQuestionControllerProvider.notifier)
                                .addWeakQuestion(
                                    categoryDocRef: question.categoryDocRef!,
                                    quizDocRef: question.quizDocRef!,
                                    questionDocRef: question.questionDocRef!);
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
                                                weakQuestionControllerProvider
                                                    .notifier)
                                            .retrieveWeakQuestionList();
                                        if (!mounted) return;
                                        Navigator.pop(context);
                                      },
                                      child: const Text("戻る"),
                                    ),
                                  ]);
                                });
                            // ref.watch(weakQuestionControllerProvider);
                          },
                          icon: const Icon(Icons.check_box_outline_blank),
                        );
                  // }
                } else {
                  return Container(
                    color: Colors.red,
                  );
                }
              }),
        ],
      ),
    );
  }
}
