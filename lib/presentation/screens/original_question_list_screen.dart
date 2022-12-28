import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/original_question_controller.dart';
import 'package:quiz_app/presentation/screens/original_question_set_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/original_question_list_card.dart';

class OriginalQuestionListScreen extends HookConsumerWidget {
  const OriginalQuestionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalQuestionState = ref.watch(originalQuestionControllerProvider);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("オリジナル問題"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const OriginalQuestionSetScreen()));
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                originalQuestionState.when(
                  data: (originalQuestionList) => originalQuestionList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("自分で問題を追加して解いてみましょう！"),
                              Lottie.asset(
                                "assets/original_question.json",
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
                              itemCount: originalQuestionList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final originalQuestion =
                                    originalQuestionList[index];
                                return OriginalQuestionListCard(
                                  originalQuestion: originalQuestion,
                                );
                              },
                            ),
                          ],
                        ),
                  error: (error, _) => const Center(child: Text("エラー")),
                  loading: () => Center(
                      child: Lottie.asset("assets/loading.json",
                          width: 200, height: 200)),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const CategorySetScreen()));
                //     },
                //     child: const Text("管理者用 問題作成")),
              ],
            ),
          ),
        ),
        floatingActionButton: originalQuestionState.when(
            data: (originalQuestionList) => originalQuestionList.isEmpty
                ? const SizedBox()
                : FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: const Text("オリジナル問題"),
                                    ),
                                    body: QuizScreen(
                                        reader: ref.watch,
                                        questionList: originalQuestionState
                                            .asData!.value),
                                  )));
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
            error: (error, _) => const Center(child: Text("エラー")),
            loading: () => const Center(
                  child: SizedBox(),
                )));
  }
}
