import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/option/option.dart';
import '../screens/quiz_screen.dart';

class QuestionOption extends HookConsumerWidget {
  final Option option;
  final bool isSelected;
  final int index;
  final bool optionIsCorrect;

  const QuestionOption({
    required this.index,
    required this.option,
    required this.optionIsCorrect,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
            color: ref.watch(optionGestureProvider)
                ? option.isCorrect
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.background,
            border: Border.all(width: 0.7),
            // border: ref.watch(optionGestureProvider)
            //     ? option.isCorrect
            //         ? Border.all(
            //             width: 4.0,
            //             color: Theme.of(context).colorScheme.primary)
            //         : Border.all(
            //             width: 0.7,)
            //     : Border.all(width: 0.7),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            option.text,
            style: TextStyle(
              fontSize: option.text.length > 13 ? 20 : 23,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.left,
          ),
        ));
    // Row(
    //   children: [
    // SizedBox(
    //   width: 50,
    //   height: 50,
    //   child: Stack(
    //     alignment: Alignment.center,
    //     children: [
    // Container(
    //   alignment: Alignment.center,
    //   width: 40,
    //   height: 40,
    //   decoration: BoxDecoration(
    //       border: Border.all(
    //           color: ref.watch(questionAnswerProvider.notifier).state.values.last
    //               ? Theme.of(context).colorScheme.primary
    //               : Theme.of(context).colorScheme.error,
    //           width: 4),
    //       borderRadius: const BorderRadius.all(Radius.circular(20)),
    //       // color: isSelected
    //       //     ? Theme.of(context).primaryColor
    //       //     : Colors.white
    //   ),
    // ),
    // Container(
    //   alignment: Alignment.center,
    //   child: Text(
    //     optionText,
    //     style: TextStyle(
    //         color: isSelected
    //             ? Colors.white
    //             : Theme.of(context).primaryColor,
    //         fontSize: 30),
    //   ),
    // ),
    //   ],
    // ),
    // ),
    // Expanded(
    //   flex: 1,
    //   child:
    //   Container(
    //     alignment: Alignment.centerLeft,
    //     padding: const EdgeInsets.only(left: 10),
    //     child: Text(
    //       optionText,
    //       style: TextStyle(
    //         fontSize: 25,
    //         // color: Theme.of(context).primaryColor,
    //       ),
    //       textAlign: TextAlign.left,
    //     ),
    //   ),
    // );
    //     ],
    //   ),
    // );
  }
}
