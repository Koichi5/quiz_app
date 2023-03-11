import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timeLimitDangerProvider = StateProvider((ref) => false);

class TimeIndicator extends HookConsumerWidget {
  final int duration;
  final int progress;
  double borderWidth = 2;

  TimeIndicator(this.duration,
      this.progress,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 0.85;
    var percent = ((progress / duration) * 100) / 100;
    var innerWidth = ((width * percent) - borderWidth * 2);
    var innerHeight = 15 - borderWidth * 2;
    if (innerWidth < 0) {
      innerWidth = 0;
    }
    if (innerHeight < 0) {
      innerHeight = 0;
    }
    return Stack(
      children: [
        Container(
          width: width,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(15 * 0.50)),
          ),
        ),
        Container(
          width: innerWidth,
          height: innerHeight,
          margin: EdgeInsets.all(borderWidth),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(15 * 0.50)),
            // color: ThemeHelper.accentColor
          ),
        ),
      ],
    );
  }
}