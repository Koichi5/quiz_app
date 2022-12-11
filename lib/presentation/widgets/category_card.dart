import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/quiz_list_screen.dart';
import 'package:quiz_app/presentation/widgets/taken_quiz_percent_indicator.dart';

import '../../domain/category/category.dart';

class CategoryCard extends HookConsumerWidget {
  const CategoryCard({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuizListScreen(
                      category: category,
                    )));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(quiz)))
      },
      child: Card(
        key: ValueKey(category.id),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: CachedNetworkImage(
              //     width: double.infinity,
              //     imageUrl: category.imagePath!,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.name,
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TakenQuizPercentIndicator(category: category),
                      ),
                    Column(
                      children: [
                        const Text("学習済み"),
                        Text("60%"),
                        const Text("苦手問題"),
                        Text("20%"),
                        const Text("未学習"),
                        Text("20%")
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
