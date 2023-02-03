import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.7,
                //   child: Flexible(
                //     flex: 1,
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(question.text,
                //         overflow: TextOverflow.ellipsis,
                //         maxLines: 1,
                //         style: const TextStyle(fontSize: 10),),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "${question.options.elementAt(question.options.indexWhere((element) => element.isCorrect == true)).text}",
                  ),
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
                            // print(
                            //     weakQuestionList.data!.contains(WeakQuestion(
                            //         categoryDocRef: question.categoryDocRef!,
                            //         quizDocRef: question.quizDocRef!,
                            //         questionDocRef: question
                            //             .questionDocRef!)));
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
                          // ref.watch(weakQuestionControllerProvider);
                        },
                        icon: const Icon(Icons.check_box_outline_blank),
                      );
              },
              error: (error, _) => const Center(
                    child: Text("エラー"),
                  ),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          // FutureBuilder(
          //     future: ref
          //         .watch(weakQuestionRepositoryProvider)
          //         .retrieveWeakQuestionList(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<List<Question>> weakQuestionList) {
          //       if (weakQuestionList.connectionState != ConnectionState.done) {
          //         // return Center(child: Lottie.asset("assets/json_files/loading.json", width: 200, height: 200),);
          //         return const SizedBox();
          //       }
          //       // エラー発生時はエラーメッセージを表示
          //       if (weakQuestionList.hasError) {
          //         return Text(weakQuestionList.error.toString());
          //       }
          //       // データがnullでないかチェック
          //       if (weakQuestionList.hasData) {
          //         // if (weakQuestionList.data!.isEmpty) {
          //         //   return const Text("エラーです");
          //         // } else {
          //         return weakQuestionList.data!.any((element) =>
          //                 element.questionDocRef == question.questionDocRef)
          //             // return snapshot.data!.contains(WeakQuestion(
          //             //         categoryDocRef: question.categoryDocRef!,
          //             //         quizDocRef: question.quizDocRef!,
          //             //         questionDocRef: question.questionDocRef!,
          //             // ))
          //             //   return snapshot.data!.then((retrievedWeakQuestionList) => retrievedWeakQuestionList.forEach((e) => e.questionDocRef == question.questionDocRef))
          //             ? IconButton(
          //                 onPressed: ()
          //                     // async
          //                     {
          //                   // print(weakQuestionList.data!.contains(WeakQuestion(
          //                   //     categoryDocRef: question.categoryDocRef!,
          //                   //     quizDocRef: question.quizDocRef!,
          //                   //     questionDocRef: question.questionDocRef!)));
          //                   // print(snapshot.data!.map((e) =>
          //                   //     e.questionDocRef == question.questionDocRef));
          //                   // await ref
          //                   //     .watch(weakQuestionControllerProvider.notifier)
          //                   //     .deleteWeakQuestion(
          //                   //   categoryDocRef: question.categoryDocRef!,
          //                   //   quizDocRef: question.quizDocRef!,
          //                   //   questionDocRef: question.questionDocRef!,
          //                   // );
          //                   // ref.watch(weakQuestionControllerProvider);
          //                 },
          //                 icon: const Icon(Icons.check_box_outlined))
          //             : IconButton(
          //                 onPressed: () async {
          //                   if (question.categoryDocRef == null) {
          //                     showDialog(
          //                         context: context,
          //                         builder: (context) {
          //                           return SimpleDialog(
          //                             children: [
          //                               const Padding(
          //                                 padding: EdgeInsets.all(10.0),
          //                                 child: Center(
          //                                   child: Text(
          //                                     "オリジナル問題は追加できません",
          //                                     textAlign: TextAlign.center,
          //                                   ),
          //                                 ),
          //                               ),
          //                               TextButton(
          //                                 onPressed: () {
          //                                   Navigator.pop(context);
          //                                 },
          //                                 child: const Text("戻る"),
          //                               ),
          //                             ],
          //                           );
          //                         });
          //                   } else {
          //                     // print(
          //                     //     weakQuestionList.data!.contains(WeakQuestion(
          //                     //         categoryDocRef: question.categoryDocRef!,
          //                     //         quizDocRef: question.quizDocRef!,
          //                     //         questionDocRef: question
          //                     //             .questionDocRef!)));
          //                     await ref
          //                         .watch(weakQuestionRepositoryProvider)
          //                         .addWeakQuestion(question: question);
          //                     showDialog(
          //                         context: context,
          //                         builder: (context) {
          //                           return SimpleDialog(children: [
          //                             const Padding(
          //                               padding: EdgeInsets.all(10.0),
          //                               child: Center(
          //                                 child: Text(
          //                                   "追加しました",
          //                                   textAlign: TextAlign.center,
          //                                 ),
          //                               ),
          //                             ),
          //                             TextButton(
          //                               onPressed: (
          //                                   [bool mounted = true]) async {
          //                                 await ref
          //                                     .watch(
          //                                         weakQuestionRepositoryProvider)
          //                                     .retrieveWeakQuestionList();
          //                                 if (!mounted) return;
          //                                 Navigator.pop(context);
          //                               },
          //                               child: const Text("戻る"),
          //                             ),
          //                           ]);
          //                         });
          //                   }
          //                   // ref.watch(weakQuestionControllerProvider);
          //                 },
          //                 icon: const Icon(Icons.check_box_outline_blank),
          //               );
          //         // }
          //       } else {
          //         return Container(
          //           color: Colors.red,
          //         );
          //       }
          //     }),
        ],
      ),
    );
  }
}
