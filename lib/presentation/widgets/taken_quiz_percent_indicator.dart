import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz_app/domain/repository/weak_question_repository.dart';
import 'package:quiz_app/domain/weak_question/weak_question.dart';
import 'package:quiz_app/presentation/controller/weak_question_controller.dart';

import '../../domain/category/category.dart';

// 当該のカテゴリの中にユーザが登録した苦手問題が何問あるかを監視する StateProvider
final weakQuestionInCategoryCountProvider = StateProvider((ref) => 0);

class TakenQuizPercentIndicator extends HookConsumerWidget {
  const TakenQuizPercentIndicator({required this.category, Key? key})
      : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //　必要な数字：カテゴリ内に含まれる question の数、ユーザの苦手問題の数、ユーザの完了問題数
    //カテゴリ内に含まれる question の数
    final int categoryQuestionCount = category.categoryQuestionCount;
    return FutureBuilder(
        future: ref
            .watch(weakQuestionRepositoryProvider)
            .retrieveWeakQuestionList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<WeakQuestion>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            // snapshot にはユーザの苦手問題のリストが含まれており、選択したカテゴリのドキュメントリファレンスと苦手問題のカテゴリのドキュメントリファレンスが一致していればカウントが一つ増える
            if (snapshot.data!.any((element) =>
                element.categoryDocRef == category.categoryDocRef)) {
              ref.watch(weakQuestionInCategoryCountProvider.notifier).state++;
            } else {
              null;
            }
            return Stack(
              children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  progressColor: Colors.grey,
                  backgroundColor: Colors.transparent,
                  animation: true,
                ),
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 5.0,
                  percent: 0.8,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.transparent,
                  animation: true,
                ),
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 5.0,
                  percent: 0.6,
                  progressColor: Colors.green,
                  backgroundColor: Colors.transparent,
                  animation: true,
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        });
  }
}
