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
    // return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => QuizListScreen(
      //                 category: category,
      //               )));
      //   // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(quiz)))
      // },
      // child:
      return Card(
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
                // color: Colors.grey.shade300,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TakenQuizPercentIndicator(category: category),
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
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                            ),
                            const Text("学習済 "),
                            const Text("80%"),
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
                                    color: Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(100)
                                ),
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
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                            ),
                            const Text("未学習 "),
                            const Text("10%")
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    // style: OutlinedButton.styleFrom(
                    //   backgroundColor: Theme.of(context).colorScheme.primary,
                    // ),
                      onPressed: (){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => QuizListScreen(
                        //           category: category,
                        //         )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("苦手問題", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizListScreen(
                                    category: category,
                                  )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("ランダム", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}
