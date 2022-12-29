import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/category/category.dart';
import 'package:quiz_app/presentation/screens/quiz_list_screen.dart';

import '../../domain/quiz/quiz.dart';
import '../controller/quiz_controller.dart';

final weakQuestionInCategoryCountProvider = StateProvider((ref) => 0);

class CategoryDetailScreen extends HookConsumerWidget {
  const CategoryDetailScreen({required this.category, Key? key})
      : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String categoryName = category.name;
    final String categoryDescription = category.description;
    final String categoryImagePath = category.imagePath;
    final int categoryQuestionCount = category.categoryQuestionCount;
    final int weakQuestionInCategoryCount =
        ref.watch(weakQuestionInCategoryCountProvider);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            categoryImagePath,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref
                      .watch(weakQuestionInCategoryCountProvider.notifier)
                      .state = 0;
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                color: Theme.of(context).colorScheme.background,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, right: 40.0, bottom: 20.0, left: 40.0),
                          child: Text(
                            categoryName,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 40.0),
                          child: Text(categoryDescription),
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0,
                                      right: 20.0,
                                      bottom: 20.0,
                                      left: 40),
                                  child: Icon(
                                    Icons.question_mark,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                                const Text("問題数"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 40.0),
                              child: Text("$categoryQuestionCount 問"),
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0,
                                      right: 20.0,
                                      bottom: 20.0,
                                      left: 40),
                                  child: Icon(
                                    Icons.timer,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                                const Text("所要時間"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 40.0),
                              child: Text("${categoryQuestionCount * 10} 秒"),
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0,
                                      right: 20.0,
                                      bottom: 20.0,
                                      left: 40),
                                  child: Icon(
                                    Icons.star,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                                const Text("苦手問題"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 40.0),
                              child: Text("$weakQuestionInCategoryCount 問"),
                            ),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ElevatedButton(
                              onPressed: ([bool mounted = true]) async {
                                // final quizList =
                                //    await ref.watch(quizControllerProvider(category)).asData!.value;
                                // print(quizList);
                                if (!mounted) return;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuizListScreen(
                                                category: category,
                                                // quizList: quizList,
                                              )));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary),
                              child: Text(
                                "スタート",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () {
      //     Navigator.pop(context);
      //   },
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      //   flexibleSpace: Image.network(
      //   'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
      //   fit: BoxFit.cover,
      //   ),
      //   toolbarHeight: 200,
      //   backgroundColor: Colors.transparent,
      // ),
    );
  }
}
