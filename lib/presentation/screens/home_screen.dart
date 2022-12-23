import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/category_list_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/screens/review_screen.dart';
import 'package:quiz_app/presentation/widgets/bottom_nav_bar.dart';

import '../../domain/question/question.dart';
import '../../domain/repository/question_repository.dart';
import '../widgets/segmented_button.dart';
import 'original_question_list_screen.dart';
import 'setting_screen.dart';

final List homePageList = [
  const CategoryListScreen(),
  const OriginalQuestionListScreen(),
  const ReviewScreen(),
  SettingScreen(),
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarSelectedIndex =
        ref.watch(bottomNavBarSelectedIndexProvider);
    return Scaffold(
      appBar: bottomNavBarSelectedIndex == 1
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              title: bottomNavBarSelectedIndex == 0
                  ? const Text("ホーム")
                  : bottomNavBarSelectedIndex == 2
                      ? const Text("復習")
                      : const Text("設定")),
      bottomNavigationBar: BottomNavBar(),
      body: pageController(bottomNavBarSelectedIndex),
      floatingActionButton: bottomNavBarSelectedIndex == 2
          ? ref.watch(currentSelectedIndexProvider) == 0
              ? FloatingActionButton(
                  onPressed: () async {
                    final List<Question> userWeakQuestionList = await ref
                        .watch(questionRepositoryProvider)
                        .retrieveWeakQuestionList();
                    if (userWeakQuestionList != []) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: const Text("苦手問題"),
                                      automaticallyImplyLeading: false,
                                    ),
                                    body: QuizScreen(
                                        questionList: userWeakQuestionList),
                                  )));
                    }
                  },
                  child: const Icon(Icons.play_arrow),
                )
              : null
          : null,
    );
  }

  pageController(i) {
    return homePageList[i];
  }
}
