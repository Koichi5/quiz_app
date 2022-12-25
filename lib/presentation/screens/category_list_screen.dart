import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/category_controller.dart';
import 'package:quiz_app/presentation/widgets/category_card2.dart';

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
              error: (error, _) => const Text("エラー"),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))
        ],
      ),
    );
  }
}
