// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/domain/repository/question_repository.dart';
// import 'package:quiz_app/presentation/controller/weak_question_controller.dart';
//
// import '../../domain/question/question.dart';
// import '../widgets/weak_question_card.dart';
//
// class WeakQuestionListScreen extends HookConsumerWidget {
//   const WeakQuestionListScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final weakQuestionListState = ref.watch(weakQuestionControllerProvider);
//     return SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             weakQuestionListState.when(
//                 data: (weakQuestionList) => weakQuestionList.isEmpty
//                     ? const Center(
//                         child: Text('苦手問題はありません'),
//                       )
//                     : FutureBuilder(
//                         future: ref
//                             .watch(questionRepositoryProvider)
//                             .retrieveWeakQuestionList(
//                                 weakQuestionList: weakQuestionList),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<List<Question>>
//                                 retrievedWeakQuestionList) {
//                           if (retrievedWeakQuestionList.connectionState !=
//                               ConnectionState.done) {
//                             return const Center(
//                                 child: CircularProgressIndicator());
//                           }
//                           // エラー発生時はエラーメッセージを表示
//                           if (retrievedWeakQuestionList.hasError) {
//                             return Text(
//                                 retrievedWeakQuestionList.error.toString());
//                           }
//                           // データがnullでないかチェック
//                           if (retrievedWeakQuestionList.hasData) {
//                             return ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 itemCount: retrievedWeakQuestionList.data!.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   final retrievedWeakQuestion =
//                                       retrievedWeakQuestionList.data![index];
//                                   return WeakQuestionCard(
//                                       question: retrievedWeakQuestion);
//                                 });
//                           } else {
//                             return const Text("苦手問題がありません");
//                           }
//                         }),
//                 //                 : ListView.builder(
//                 //               itemCount: weakQuestionList.length,
//                 // itemBuilder: (BuildContext context, int index) {
//                 //   final retrievedWeakQuestionList = await ref.watch(questionRepositoryProvider).retrieveWeakQuestionList(weakQuestionList: weakQuestionList);
//                 //   final retrievedWeakQuestion = retrievedWeakQuestionList[index];
//                 //   return WeakQuestionCard();
//                 // },
//                 //                     ),
//                 error: (error, _) => const Text("エラー"),
//                 loading: () => const Center(
//                       child: CircularProgressIndicator(),
//                     )),
//             ElevatedButton(onPressed: (){}, child: const Text("クイズ"))
//           ],
//         ),
//       );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/repository/weak_question_repository.dart';
import 'package:quiz_app/presentation/widgets/weak_question_card.dart';

import '../../domain/weak_question/weak_question.dart';

class WeakQuestionScrollListView extends HookConsumerWidget {
  static const _threshold = 0.7;
  const WeakQuestionScrollListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weakQuestionScrollListViewProvider.notifier).state;

    // if (state.error != null) {
    //   _showErrorSnackBar(state.error!);
    // }
    _showErrorSnackBar(context, ref, "エラー");

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        final scrollProportion =
            scrollInfo.metrics.pixels / scrollInfo.metrics.maxScrollExtent;
        if (state.isLoading) {
          ref.watch(weakQuestionScrollListViewProvider.notifier).fetchList();
        }
        return false;
      },
      child: state.weakQuestionList.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: state.weakQuestionList.length,
              itemBuilder: (BuildContext context, int index) {
                return WeakQuestionCard(
                    question: state.weakQuestionList[index]);
              },
            )
          : _emptyListView(),
    );
  }

  Widget _buildRow(WeakQuestion item) {
    return SizedBox(
      height: 80,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Text(
            item.quizDocRef,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _emptyListView() {
    return const Center(
      child: Text(
        'Item not found.',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
      ),
    );
  }

  void _showErrorSnackBar(
      BuildContext context, WidgetRef ref, String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(days: 365),
      action: SnackBarAction(
        label: '再試行',
        onPressed: () {
          // 一覧取得
          ref.watch(weakQuestionScrollListViewProvider.notifier).fetchList();
          // snackBar非表示
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
    );
    // 全Widgetのbuild後にsnackBarを表示させる
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
