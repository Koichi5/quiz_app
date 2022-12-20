import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/original_question_controller.dart';
import 'package:quiz_app/presentation/screens/category_set_screen.dart';
import 'package:quiz_app/presentation/screens/original_question_set_screen.dart';
import 'package:quiz_app/presentation/widgets/original_question_list_card.dart';

class OriginalQuestionListScreen extends HookConsumerWidget {
  const OriginalQuestionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalQuestionState = ref.watch(originalQuestionControllerProvider);
    return Scaffold(
      appBar: AppBar(
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
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            originalQuestionState.when(
              data: (originalQuestionList) => originalQuestionList.isEmpty
                  ? const Center(
                      child: Material(child: Text("オリジナル問題はありません")),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: originalQuestionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final originalQuestion = originalQuestionList[index];
                        return OriginalQuestionListCard(
                          originalQuestion: originalQuestion,
                        );
                      },
                    ),
              error: (error, _) => const Center(child: Text("エラー")),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategorySetScreen()));
                },
                child: const Text("管理者用 問題作成")),
          ],
        ),
      ),
    );
  }
}
