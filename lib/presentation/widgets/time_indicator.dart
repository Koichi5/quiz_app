import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timeLimitDangerProvider = StateProvider((ref) => false);

class TimeIndicator extends HookConsumerWidget {
  final int duration;
  // final VoidCallback onComplete;
  final int progress;
  double borderWidth = 2;

  TimeIndicator(this.duration,
      this.progress,
      // this.onComplete,
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
//
// class _TimeIndicatorState extends ConsumerState<TimeIndicator> {
//   int duration;
//   VoidCallback onComplete;
//   double width;
//   double height;
//   double borderWidth = 4;
//   int progress;
//
//   _TimeIndicatorState(
//       {required this.duration,
//       required this.progress,
//       required this.onComplete,
//       required this.width,
//       required this.height});
//
//   @override
//   Widget build(BuildContext context) {
//     var percent = ((ref.watch(remainTimeProvider) / duration) * 100) / 100;
//     print("percent : $percent");
//     var innerWidth = ((width * percent) - borderWidth * 2);
//     var innerHeight = height - borderWidth * 2;
//     if (innerWidth < 0) {
//       innerWidth = 0;
//     }
//     if (innerHeight < 0) {
//       innerHeight = 0;
//     }
//
//     return Stack(
//       children: [
//         Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
//             border: Border.all(
//               width: borderWidth,
//               // color: ThemeHelper.primaryColor
//             ),
//           ),
//         ),
//
//         Container(
//           width: innerWidth,
//           height: innerHeight,
//           margin: EdgeInsets.all(borderWidth),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
//             border: Border.all(
//               width: 5,
//               // color: ThemeHelper.accentColor
//             ),
//             // color: ThemeHelper.accentColor
//           ),
//         ),
//       ],
//     );
//   }
// }
