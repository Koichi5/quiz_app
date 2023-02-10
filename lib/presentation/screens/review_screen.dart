import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/quiz_history_screen.dart';
import 'package:quiz_app/presentation/screens/weak_question_screen.dart';
import 'package:quiz_app/presentation/widgets/segmented_button.dart';

final List<Widget> reviewScreenList = [
  const WeakQuestionScreen(),
  const QuizHistoryScreen(),
];

class ReviewScreen extends HookConsumerWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OriginalSegmentedButton(),
          reviewScreenPageController(ref.watch(currentSelectedIndexProvider)),
        ],
      ),
    );
  }

  reviewScreenPageController(int currentPageIndex) {
    return reviewScreenList[currentPageIndex];
  }
}
