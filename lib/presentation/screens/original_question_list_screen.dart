import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/original_question_controller.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/original_question_list_card.dart';

import 'original_question_set_screen.dart';

class OriginalQuestionListScreen extends HookConsumerWidget {
  OriginalQuestionListScreen({Key? key}) : super(key: key);

  final List<String> dictionaryWordList = [];
  final List<String> dictionaryDescriptionList = [];
  final List<String> dictionaryUrlList = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalQuestionState = ref.watch(originalQuestionControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("オリジナル問題"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OriginalQuestionSetScreen()));
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            const Text("自分で問題を追加して解いてみましょう！"),
                            Lottie.asset(
                              "assets/json_files/original_question.json",
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
                loading: () => Center(
                    child: Lottie.asset("assets/json_files/loading.json",
                        width: 200, height: 200)),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const CategorySetScreen()));
              //   },
              //   child: const Text("管理者用 問題作成"),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     for (int i = 0; i < dictionaryWordList.length; i++) {
              //       await ref
              //           .watch(firebaseFirestoreProvider)
              //           .collection("dictionary")
              //           .add({
              //         "dictionaryWord": dictionaryWordList[i],
              //         "dictionaryDescription": dictionaryDescriptionList[i],
              //         "dictionaryUrl": dictionaryUrlList[i],
              //       });
              //     }
              //   },
              //   child: const Text(
              //     "辞書追加",
              //   ),
              // ),
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
                          leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ref
                                  .watch(currentQuestionIndexProvider.notifier)
                                  .state = 1;
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          centerTitle: true,
                          title: const Text("オリジナル問題"),
                        ),
                        body: QuizScreen(
                            reader: ref.watch,
                            questionList: originalQuestionState.asData!.value),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.play_arrow),
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
        loading: () => const Center(
          child: SizedBox(),
        ),
      ),
    );
  }
}
