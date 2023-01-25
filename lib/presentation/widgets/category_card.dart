import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/repository/question_repository.dart';
import 'package:quiz_app/presentation/screens/category_detail_screen.dart';

import '../../domain/category/category.dart';
import '../../domain/repository/weak_question_repository.dart';

class CategoryCard extends HookConsumerWidget {
  const CategoryCard({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: ([bool mounted = true]) async {
        ref.watch(weakQuestionInCategoryCountProvider.notifier).state = 0;
        await ref
            .watch(questionRepositoryProvider)
            .retrieveWeakQuestionList()
            .then((weakQuestionList) {
              for (var weakQuestion in weakQuestionList) {
                if (weakQuestion.categoryDocRef == category.categoryDocRef) {
                  ref.watch(weakQuestionInCategoryCountProvider.notifier).state++;
                }
              }
          // value.forEach(
          //   (element) {
          //     if (element.categoryDocRef == category.categoryDocRef) {
          //       ref.watch(weakQuestionInCategoryCountProvider.notifier).state++;
          //     }
          //   },
          // );
        });
        // final List<QuizHistory> quizHistoryList = await ref
        //     .watch(quizHistoryControllerProvider.notifier)
        //     .retrieveQuizHistoryList();
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(
              category: category,
              // quizHistoryList: quizHistoryList,
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink(
              height: 240,
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: BorderedText(
                strokeWidth: 0.8,
                strokeColor: Theme.of(context).colorScheme.onSurface,
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
