import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/category_list_screen.dart';
import 'package:quiz_app/presentation/screens/review_screen.dart';
import 'package:quiz_app/presentation/widgets/bottom_nav_bar.dart';

import 'original_question_list_screen.dart';
import 'setting_screen.dart';

final List<Widget> homePageList = [
  const CategoryListScreen(),
  const OriginalQuestionListScreen(),
  const ReviewScreen(),
  const SettingScreen(),
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
    );
  }

  pageController(i) {
    return homePageList[i];
  }
}
