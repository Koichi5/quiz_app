import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/controller/category_controller.dart';

import '../widgets/category_card.dart';

class CategoryListScreen extends HookConsumerWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryListState = ref.watch(categoryControllerProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          categoryListState.when(
            data: (categories) => categories.isEmpty
                ? const Center(
                    child: Text("カテゴリはありません"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = categories[index];
                      return CategoryCard(category: category);
                    },
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
                  width: 200, height: 200),
            ),
          ),
        ],
      ),
    );
  }
}
