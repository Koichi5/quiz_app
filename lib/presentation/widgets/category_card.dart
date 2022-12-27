import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/category_detail_screen.dart';

import '../../domain/category/category.dart';
import '../../domain/quiz_history/quiz_history.dart';
import '../../domain/repository/weak_question_repository.dart';
import '../../domain/weak_question/weak_question.dart';
import '../controller/quiz_history_controller.dart';

class CategoryCard extends HookConsumerWidget {
  const CategoryCard({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final List<WeakQuestion> weakQuestionList = await ref
            .watch(weakQuestionRepositoryProvider)
            .retrieveWeakQuestionList();
        // final List<QuizHistory> quizHistoryList = await ref
        //     .watch(quizHistoryControllerProvider.notifier)
        //     .retrieveQuizHistoryList();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(
                      category: category,
                  weakQuestionList: weakQuestionList,
                  // quizHistoryList: quizHistoryList,
                    )));
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
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Text(
                category.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
