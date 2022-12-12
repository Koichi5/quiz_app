import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/question/question.dart';
import 'package:quiz_app/domain/weak_question/weak_question.dart';
import 'package:quiz_app/general/general_provider.dart';
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        answerIsCorrect
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
        Text(question.text),
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
        FutureBuilder(
            future: ref
                .watch(weakQuestionControllerProvider.notifier)
                .retrieveWeakQuestionList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<WeakQuestion>> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              // エラー発生時はエラーメッセージを表示
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              // データがnullでないかチェック
              if (snapshot.hasData) {
                return snapshot.data!.any((element) =>
                        element.questionDocRef == question.questionDocRef)
                    // return snapshot.data!.contains(WeakQuestion(
                    //         categoryDocRef: question.categoryDocRef!,
                    //         quizDocRef: question.quizDocRef!,
                    //         questionDocRef: question.questionDocRef!,
                    // ))
                    //   return snapshot.data!.then((retrievedWeakQuestionList) => retrievedWeakQuestionList.forEach((e) => e.questionDocRef == question.questionDocRef))
                    ? IconButton(
                        onPressed: () {
                          // print(snapshot.data!.contains(WeakQuestion(
                          //     categoryDocRef: question.categoryDocRef!,
                          //     quizDocRef: question.quizDocRef!,
                          //     questionDocRef: question.questionDocRef!)));
                          // print(snapshot.data!.map((e) =>
                          //     e.questionDocRef == question.questionDocRef));
                          ref
                              .watch(weakQuestionControllerProvider.notifier)
                              .deleteWeakQuestion(
                                  quizDocRef: question.quizDocRef!,
                                  categoryDocRef: question.categoryDocRef!,
                                  questionDocRef: question.questionDocRef!);
                        },
                        icon: const Icon(Icons.check_box_outlined))
                    : IconButton(
                        onPressed: () {
                          print(snapshot.data!.contains(WeakQuestion(
                              categoryDocRef: question.categoryDocRef!,
                              quizDocRef: question.quizDocRef!,
                              questionDocRef: question.questionDocRef!)));
                          ref
                              .watch(weakQuestionControllerProvider.notifier)
                              .addWeakQuestion(
                                  quizDocRef: question.quizDocRef!,
                                  categoryDocRef: question.categoryDocRef!,
                                  questionDocRef: question.questionDocRef!);
                        },
                        icon: const Icon(Icons.check_box_outline_blank));
              } else {
                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              }
            })
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
    );
  }
}
