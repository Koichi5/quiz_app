// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:lottie/lottie.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// import '../../domain/category/category.dart';
// import '../../domain/quiz_history/quiz_history.dart';
// import '../../domain/repository/weak_question_repository.dart';
// import '../../domain/weak_question/weak_question.dart';
// import '../controller/quiz_history_controller.dart';
//
// // 当該のカテゴリの中にユーザが登録した苦手問題が何問あるかを監視する StateProvider
// final weakQuestionInCategoryCountProvider = StateProvider((ref) => 0);
//
// //当該のカテゴリの問題を全て完了しているかどうかを監視する StateProvider
// // 問題数までは監視せず、あくまで user が当該カテゴリのクイズを完了しているかどうかのみ監視
// // したがって、値は bool
// final userTakenQuestionInCategoryProvider = StateProvider((ref) => false);
//
// class TakenQuizPercentIndicator extends HookConsumerWidget {
//   const TakenQuizPercentIndicator(
//       {required this.category,
//       // required this.weakQuestionList,
//       // required this.quizHistoryList,
//       Key? key})
//       : super(key: key);
//
//   final Category category;
//   // final List<WeakQuestion> weakQuestionList;
//
//   // final List<QuizHistory> quizHistoryList;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final weakQuestionInCategoryCount =
//         ref.watch(weakQuestionInCategoryCountProvider);
//     final weakQuestionInCategoryCountNotifier =
//         ref.watch(weakQuestionInCategoryCountProvider.notifier);
//     // 必要な数字：
//     // カテゴリ内に含まれる question の数 category.categoryQuestionCount
//     // ユーザの苦手問題の数
//     // ユーザの完了問題数
//     // カテゴリ内に含まれる question の数
//     // 割合表示の場合
//     // 未学習が100% の場合( 学習済みが0%の場合 )
//     // 未学習が0%なので、苦手問題も0% = 全て灰色
//     // 未学習が0% の場合 (学習済みが100%の場合)
//     // 学習済みが 100% なので全て緑色、学習済みの中に苦手問題があるので、学習済み問題＝学習済み＆苦手でない問題 + 学習済み＆苦手問題
//     // 　学習済み＆苦手でない問題 = カテゴリ内の問題数 - 苦手問題数
//     // カテゴリ内の問題数 = category.categoryQuestionCount
//     // 　苦手問題数 = weakQuestionInCategoryCount
//     final int categoryQuestionCount = category.categoryQuestionCount;
//     // userの苦手問題数 / カテゴリ内の問題数 割合 0 ~ 1
//     final double weakQuestionCountPerCategoryQuestionCount =
//         ref.watch(weakQuestionInCategoryCountProvider) / categoryQuestionCount;
//     return FutureBuilder(
//         future: ref
//             .watch(quizHistoryControllerProvider.notifier)
//             .retrieveQuizHistoryList(),
//         builder: (BuildContext context,
//             AsyncSnapshot<List<QuizHistory>> userQuizHistory) {
//           if (userQuizHistory.connectionState != ConnectionState.done) {
//             return Center(child: Lottie.asset("assets/json_files/loading.json", width: 200, height: 200),);
//           }
//           if (userQuizHistory.hasError) {
//             return Text(userQuizHistory.error.toString());
//           }
//           if (userQuizHistory.hasData) {
//             // snapshot にはユーザの苦手問題のリストが含まれており、選択したカテゴリのドキュメントリファレンスと苦手問題のカテゴリのドキュメントリファレンスが一致していればカウントが一つ増える
//             if (userQuizHistory.data!.any((element) =>
//                 element.categoryDocRef == category.categoryDocRef)) {
//               ref.watch(userTakenQuestionInCategoryProvider.notifier).state =
//                   true;
//               return Stack(
//                 children: [
//                   // 未完了問題数
//                   CircularPercentIndicator(
//                     radius: 80.0,
//                     lineWidth: 8.0,
//                     percent: ref.watch(userTakenQuestionInCategoryProvider)
//                         ? 0.0
//                         : 1.0,
//                     progressColor: Colors.grey,
//                     backgroundColor: Colors.transparent,
//                     animation: true,
//                   ),
//                   // 苦手問題数
//                   CircularPercentIndicator(
//                     radius: 80.0,
//                     lineWidth: 8.0,
//                     progressColor: Theme.of(context).colorScheme.tertiary,
//                     backgroundColor: Colors.transparent,
//                     animation: true,
//                   ),
//                   // 学習済み問題数
//                   CircularPercentIndicator(
//                     center: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: const [Text("学習済"), Text("80%")],
//                     ),
//                     radius: 80.0,
//                     lineWidth: 8.0,
//                     // user の quizHistory に当該カテゴリが含まれている(user がカテゴリを終了している)
//                     // user の weakQuestionCount が 0 ではない
//                     // カテゴリ内全体の問題数に対する weakQuestion の割合を示す必要がある
//                     percent: ref.watch(userTakenQuestionInCategoryProvider)
//                         ? ref.watch(weakQuestionInCategoryCountProvider) != 0
//                             ? 1.0 - weakQuestionCountPerCategoryQuestionCount
//                             : 1.0
//                         : 0.0,
//                     progressColor: Theme.of(context).colorScheme.primary,
//                     backgroundColor: Colors.transparent,
//                     animation: true,
//                   ),
//                 ],
//               );
//               ;
//             } else {
//               return SizedBox();
//             }
//           } else {
//             return SizedBox();
//           }
//         });
//   }
// }
//     return FutureBuilder(
//         future: ref
//             .watch(weakQuestionRepositoryProvider)
//             .retrieveWeakQuestionList(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<WeakQuestion>> snapshot) {
//           if (snapshot.connectionState != ConnectionState.done) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           if (snapshot.hasData) {
//             // snapshot にはユーザの苦手問題のリストが含まれており、選択したカテゴリのドキュメントリファレンスと苦手問題のカテゴリのドキュメントリファレンスが一致していればカウントが一つ増える
//             if (snapshot.data!.any((element) =>
//                 element.categoryDocRef == category.categoryDocRef)) {
//               ref.watch(weakQuestionInCategoryCountProvider.notifier).state++;
//             } else {
//               return const SizedBox();
//             }
//             // user の quizHistory から、完了したクイズのカテゴリを抽出し、それを含む場合は 100% 完了したことになる
//             return FutureBuilder(
//                 future: ref
//                     .watch(quizHistoryControllerProvider.notifier)
//                     .retrieveQuizHistoryList(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<List<QuizHistory>> snapshot) {
//                   if (snapshot.connectionState != ConnectionState.done) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   if (snapshot.hasError) {
//                     return Text(snapshot.error.toString());
//                   }
//                   if (snapshot.hasData) {
//                     // snapshot にはユーザの苦手問題のリストが含まれており、選択したカテゴリのドキュメントリファレンスと苦手問題のカテゴリのドキュメントリファレンスが一致していればカウントが一つ増える
//                     if (snapshot.data!.any((element) =>
//                         element.categoryDocRef == category.categoryDocRef)) {
//                       ref
//                           .watch(userTakenQuestionInCategoryProvider.notifier)
//                           .state = true;
//     return Stack(
//     children: [
//     // 未完了問題数
//     CircularPercentIndicator(
//     radius: 80.0,
//     lineWidth: 8.0,
//     percent: 1.0,
//     // ref.watch(userTakenQuestionInCategoryProvider)
//     //     ? 0.0
//     //     : 1.0,
//     progressColor: Colors.grey,
//     backgroundColor: Colors.transparent,
//     animation: true,
//     ),
//     // 苦手問題数
//     CircularPercentIndicator(
//     radius: 80.0,
//     lineWidth: 8.0,
//     percent: 0.9,
//     // ref.watch(userTakenQuestionInCategoryProvider)
//     //     ? 1.0
//     //     : 0,
//     progressColor: Theme.of(context).colorScheme.tertiary,
//     backgroundColor: Colors.transparent,
//     animation: true,
//     ),
//     // 学習済み問題数
//     CircularPercentIndicator(
//     center: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: const [
//     Text("学習済"),
//     Text("80%")
//     ],
//     ),
//     radius: 80.0,
//     lineWidth: 8.0,
//     // user の quizHistory に当該カテゴリが含まれている(user がカテゴリを終了している)
//     // user の weakQuestionCount が 0 ではない
//     // カテゴリ内全体の問題数に対する weakQuestion の割合を示す必要がある
//     percent: 0.8,
//     // percent: ref
//     //         .watch(userTakenQuestionInCategoryProvider)
//     //     ? ref.watch(weakQuestionInCategoryCountProvider) !=
//     //             0
//     //         ? 1.0 -
//     //             weakQuestionCountPerCategoryQuestionCount
//     //         : 1.0
//     //     : 0.0,
//     progressColor: Theme.of(context).colorScheme.primary,
//     backgroundColor: Colors.transparent,
//     animation: true,
//     ),
//     ],
//     );
//                     } else {
//                       return const SizedBox();
//                     }
//         //           } else {
//         //             return const SizedBox();
//         //           }
//         //         });
//         //   } else {
//         //     return const SizedBox();
//         //   }
//         // });
// }});}}
//     );
