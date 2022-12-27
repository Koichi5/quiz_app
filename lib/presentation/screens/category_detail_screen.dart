import 'package:flutter/material.dart';
import 'package:quiz_app/domain/category/category.dart';

import '../../domain/quiz_history/quiz_history.dart';
import '../../domain/weak_question/weak_question.dart';
import '../widgets/taken_quiz_percent_indicator.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen(
      {required this.category,
      required this.weakQuestionList,
      // required this.quizHistoryList,
      Key? key})
      : super(key: key);

  final Category category;
  final List<WeakQuestion> weakQuestionList;
  // final List<QuizHistory> quizHistoryList;

  @override
  Widget build(BuildContext context) {
    final String categoryName = category.name;
    final String categoryDescription = category.description;
    final String categoryImagePath = category.imagePath;
    final int categoryQuestionCount = category.categoryQuestionCount;
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
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
                      Divider(),
                      Container(
                        width: double.infinity,
                        // color: Theme.of(context).colorScheme.surfaceVariant,
                        // color: Colors.grey.shade300,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child:
                                  TakenQuizPercentIndicator(category: category, weakQuestionList: weakQuestionList,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                    ),
                                    const Text("学習済 "),
                                    const Text(
                                      "80%",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                    ),
                                    const Text("苦手問題 "),
                                    const Text("10%"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                    ),
                                    const Text("未学習 "),
                                    const Text("10%")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 40.0),
                            child: Text("問題数"),
                          ),
                          Text("$categoryQuestionCount 問"),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 40.0),
                            child: Text("所要時間"),
                          ),
                          Text("${categoryQuestionCount * 10} 秒"),
                        ],
                      ),
                      Divider(),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  child: Text(
                                    "スタート",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  )),
                            ),
                          ))
                    ],
                  ),
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
