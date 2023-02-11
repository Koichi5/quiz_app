import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/repository/question_repository.dart';
// import 'package:quiz_app/domain/repository/weak_question_repository.dart';
// import 'package:quiz_app/domain/weak_question/weak_question.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';
// import 'package:quiz_app/presentation/controller/weak_question_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';

import '../../domain/question/question.dart';
import '../../general/general_provider.dart';
import '../widgets/weak_question_card.dart';

class WeakQuestionScreen extends HookConsumerWidget {
  const WeakQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weakQuestionState = ref.watch(weakQuestionControllerProvider);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            weakQuestionState.when(
              data: (weakQuestionList) => weakQuestionList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          const Text("苦手問題を登録して復習しましょう！"),
                          Lottie.asset(
                            "assets/json_files/weak_question.json",
                            width: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: weakQuestionList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final retrievedWeakQuestion =
                                weakQuestionList[index];
                            return WeakQuestionCard(
                              question: retrievedWeakQuestion,
                            );
                          },
                        ),
                      ],
                    ),
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
                return Center(
                  child: Lottie.asset("assets/json_files/loading.json",
                      width: 200, height: 200),
                );
              },
            ),
            // StreamBuilder(
            //     stream: ref
            //         .watch(weakQuestionScrollListViewProvider.notifier)
            //         .retrieveWeakQuestionList(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<List<WeakQuestion>> retrievedWeakQuestionList) {
            //       if (retrievedWeakQuestionList.connectionState !=
            //           ConnectionState.done) {
            //         return Center(
            //           child: Lottie.asset("assets/json_files/loading.json",
            //               width: 200, height: 200),
            //         );
            //       }
            //       // エラー発生時はエラーメッセージを表示
            //       if (retrievedWeakQuestionList.hasError) {
            //         return Text(retrievedWeakQuestionList.error.toString());
            //       }
            //       // データがnullでないかチェック
            //       if (retrievedWeakQuestionList.hasData) {
            //         final newList = retrievedWeakQuestionList.data;
            //         return
            // FutureBuilder(
            //     future: ref
            //         .watch(weakQuestionRepositoryProvider)
            //         .retrieveWeakQuestionList(),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState != ConnectionState.done) {
            //         return Center(
            //           child: Lottie.asset("assets/json_files/loading.json",
            //               width: 200, height: 200),
            //         );
            //       }
            //       if (snapshot.hasError) {
            //         return Text(snapshot.error.toString());
            //       }
            //       if (snapshot.hasData) {
            //         return Column(
            //           // mainAxisAlignment: MainAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             ListView.builder(
            //                 shrinkWrap: true,
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 itemCount: snapshot.data!.length,
            //                 itemBuilder: (BuildContext context, int index) {
            //                   final retrievedWeakQuestion =
            //                       snapshot.data![index];
            //                   return WeakQuestionCard(
            //                       question: retrievedWeakQuestion);
            //                 }),
            //             snapshot.data!.isEmpty
            //                 ? Center(
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         SizedBox(
            //                           height:
            //                               MediaQuery.of(context).size.height *
            //                                   0.1,
            //                         ),
            //                         const Text("苦手問題を登録して復習しましょう！"),
            //                         Lottie.asset(
            //                           "assets/json_files/weak_question.json",
            //                           width: MediaQuery.of(context).size.width *
            //                               0.7,
            //                           fit: BoxFit.fitWidth,
            //                         ),
            //                       ],
            //                     ),
            //                   )
            //                 : Align(
            //                     alignment: Alignment.centerRight,
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: ElevatedButton(
            //                         onPressed: () {
            //                           ref
            //                               .watch(currentQuestionIndexProvider
            //                                   .notifier)
            //                               .state = 1;
            //                           Navigator.push(
            //                             context,
            //                             MaterialPageRoute(
            //                               builder: (context) => Scaffold(
            //                                 appBar: AppBar(
            //                                   centerTitle: true,
            //                                   title: const Text("苦手問題"),
            //                                 ),
            //                                 body: QuizScreen(
            //                                     reader: ref.watch,
            //                                     questionList: snapshot.data!),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                         style: ElevatedButton.styleFrom(
            //                             backgroundColor: Theme.of(context)
            //                                 .colorScheme
            //                                 .primary),
            //                         child: Text(
            //                           "クイズ",
            //                           style: TextStyle(
            //                               color: Theme.of(context)
            //                                   .colorScheme
            //                                   .onPrimary),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //           ],
            //         );
            //       } else {
            //         return const Center(
            //           child: Text("エラーが発生しています"),
            //         );
            //       }

            // final List<Question> questionList = [];
            // for (int i = 0; i < newList!.length; i++) {
            //   final weakQuestion = newList[i];
            //   await ref.watch(firebaseFirestoreProvider)
            //       .collection("category")
            //       .doc(weakQuestion.categoryDocRef)
            //       .collection("quiz")
            //       .doc(weakQuestion.quizDocRef)
            //       .collection("questions")
            //       .doc(weakQuestion.questionDocRef)
            //       .get();
            //   questionList.add(Question.fromDocument(snap));
            // }
            // // print(retrievedWeakQuestionList);
            // return Column(
            //   // mainAxisAlignment: MainAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     ListView.builder(
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount: retrievedWeakQuestionList.data!.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           final retrievedWeakQuestion =
            //               retrievedWeakQuestionList.data![index];
            //           return WeakQuestionCard(
            //               question: retrievedWeakQuestion);
            //         }),
            //     retrievedWeakQuestionList.data!.isEmpty
            //         ? Center(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SizedBox(
            //                   height: MediaQuery.of(context).size.height *
            //                       0.1,
            //                 ),
            //                 const Text("苦手問題を登録して復習しましょう！"),
            //                 Lottie.asset(
            //                   "assets/json_files/weak_question.json",
            //                   width:
            //                       MediaQuery.of(context).size.width * 0.7,
            //                   fit: BoxFit.fitWidth,
            //                 ),
            //               ],
            //             ),
            //           )
            //         : Align(
            //             alignment: Alignment.centerRight,
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: ElevatedButton(
            //                 onPressed: () {
            //                   ref
            //                       .watch(currentQuestionIndexProvider
            //                           .notifier)
            //                       .state = 1;
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => Scaffold(
            //                                 appBar: AppBar(
            //                                   centerTitle: true,
            //                                   title: const Text("苦手問題"),
            //                                 ),
            //                                 body: QuizScreen(
            //                                     reader: ref.watch,
            //                                     questionList:
            //                                         retrievedWeakQuestionList
            //                                             .data!),
            //                               )));
            //                 },
            //                 style: ElevatedButton.styleFrom(
            //                     backgroundColor: Theme.of(context)
            //                         .colorScheme
            //                         .primary),
            //                 child: Text(
            //                   "クイズ",
            //                   style: TextStyle(
            //                       color: Theme.of(context)
            //                           .colorScheme
            //                           .onPrimary),
            //                 ),
            //               ),
            //             ),
            //           ),
            //   ],
            // );
            // } else {
            //   return const Text("苦手問題がありません");
            // }
            // }),
          ],
        ),
      ),
    );
  }
}
