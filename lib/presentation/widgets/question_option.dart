import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionOption extends HookConsumerWidget {
  final bool isSelected;
  final String optionText;
  final int index;
  final bool optionIsCorrect;

  const QuestionOption({
    required this.index,
    // required this.optionText,
    required this.optionText,
    // required this.optionIsCorrect,
    required this.isSelected,
    required this.optionIsCorrect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(50))
      ),
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            optionText,
            style: const TextStyle(
              fontSize: 25,
              // color: Theme.of(context).primaryColor,
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
