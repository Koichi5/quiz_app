import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../general/general_provider.dart';

class WordCollectionScreen extends HookConsumerWidget {
  const WordCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "単語集",
        ),
      ),
      // body: FutureBuilder(
      //   future: ref.watch(firebaseFirestoreProvider).collection("dictionary").get(),
      //   builder: (BuildContext context, quizHistoryList) {
      //     if (quizHistoryList.connectionState != ConnectionState.done) {
      //       return Center(
      //         child: Lottie.asset("assets/json_files/loading.json",
      //             width: 200, height: 200),
      //       );
      //     }
      //     if (quizHistoryList.hasError) {
      //       return Text(quizHistoryList.error.toString());
      //     }
      //     if (quizHistoryList.hasData) {
      //       return Center();
      //     } else {
      //       return const SizedBox();
      //     }
      //   }),
      );
  }
}
