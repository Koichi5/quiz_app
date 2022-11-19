import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/category_list_screen.dart';
import 'package:quiz_app/presentation/screens/weak_point_quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/bottom_nav_bar.dart';

import 'add_quiz_screen.dart';
import 'setting_screen.dart';

final List<Widget> homePageList = [
  const CategoryListScreen(),
  const AddQuizScreen(),
  const WeakPointQuizScreen(),
  const SettingScreen(),
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarSelectedIndex =
        ref.watch(bottomNavBarSelectedIndexProvider);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: bottomNavBarSelectedIndex == 0
              ? const Text("ホーム")
              : bottomNavBarSelectedIndex == 1
                  ? const Text("追加")
                  : bottomNavBarSelectedIndex == 2
                      ? const Text("苦手問題")
                      : const Text("設定")),
      bottomNavigationBar: BottomNavBar(),
      body: pageController(bottomNavBarSelectedIndex),
    );
  }
  pageController(i) {
    return homePageList[i];
  }
}
