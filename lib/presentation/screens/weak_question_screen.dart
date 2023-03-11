import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';

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
          ],
        ),
      ),
    );
  }
}
