import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/option/option.dart';
import '../../general/general_provider.dart';
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
            border: Border.all(
              width: 0.7,
              color: isDarkMode(context)
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onBackground,
            ),
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
  }
}
