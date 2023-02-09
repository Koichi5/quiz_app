import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/question_controller.dart';
import 'package:quiz_app/presentation/screens/category_list_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/screens/review_screen.dart';
import 'package:quiz_app/presentation/widgets/bottom_nav_bar.dart';

import '../widgets/segmented_button.dart';
import 'original_question_list_screen.dart';
import 'setting_screen.dart';

final List homePageList = [
  const CategoryListScreen(),
  const ReviewScreen(),
  OriginalQuestionListScreen(),
  SettingScreen(),
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarSelectedIndex =
        ref.watch(bottomNavBarSelectedIndexProvider);
    return Scaffold(
      appBar: bottomNavBarSelectedIndex == 2
          ? null
          : AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: bottomNavBarSelectedIndex == 0
                  ? const Text("ホーム")
                  : bottomNavBarSelectedIndex == 1
                      ? const Text("復習")
                      : const Text("設定")),
      bottomNavigationBar: BottomNavBar(),
      body: pageController(bottomNavBarSelectedIndex),
      floatingActionButton: bottomNavBarSelectedIndex == 1
          ? ref.watch(currentSelectedIndexProvider) == 0
              ? ref.watch(weakQuestionControllerProvider).when(
                  data: (weakQuestionList) {
                    if (weakQuestionList.isNotEmpty) {
                      return FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  centerTitle: true,
                                  title: const Text("苦手問題"),
                                  automaticallyImplyLeading: false,
                                ),
                                body: QuizScreen(
                                  reader: ref.watch,
                                  questionList: weakQuestionList,
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.play_arrow),
                      );
                    } else {
                      return null;
                    }
                  },
                  error: (error, _) => const Center(
                        child: Text("エラーが発生しています"),
                      ),
                  loading: () => const SizedBox())
              : null
          : null,
    );
  }

  pageController(i) {
    return homePageList[i];
  }
}
