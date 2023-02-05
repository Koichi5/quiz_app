import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/dictionary_item/dictionary_item.dart';

import '../../domain/question/question.dart';
import '../controller/original_question_controller.dart';

class DictionaryCard extends HookConsumerWidget {
  const DictionaryCard({required this.dictionaryItem, Key? key})
      : super(key: key);

  final DictionaryItem dictionaryItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dictionaryItem.dictionaryWord),
          ),
          collapsed: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("解説"),
          ),
          expanded: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dictionaryItem.dictionaryDescription,
                ),
              ),
              // TextButton(
              //     onPressed: ([bool mounted = true]) async {
              //       if (originalQuestion.originalQuestionDocRef != null) {
              //         await ref
              //             .watch(originalQuestionControllerProvider.notifier)
              //             .deleteOriginalQuestion(
              //             originalQuestionDocRef:
              //             originalQuestion.originalQuestionDocRef!);
              //         if (!mounted) return;
              //         showDialog(
              //             barrierDismissible: false,
              //             context: context,
              //             builder: (context) {
              //               return SimpleDialog(children: [
              //                 const Padding(
              //                   padding: EdgeInsets.all(10.0),
              //                   child: Center(
              //                     child: Text(
              //                       "削除しました",
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ),
              //                 ),
              //                 TextButton(
              //                     onPressed: ([bool mounted = true]) async {
              //                       await ref
              //                           .watch(
              //                           originalQuestionControllerProvider
              //                               .notifier)
              //                           .retrieveOriginalQuestionList();
              //                       if (!mounted) return;
              //                       Navigator.pop(context);
              //                     },
              //                     child: const Text("戻る"))
              //               ]);
              //             });
              //       } else {
              //         null;
              //       }
              //     },
              //     child: const Text("覚えた！"))
            ],
          ),
        ),
      ),
    );
  }
}
