import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeIndicator extends HookConsumerWidget {
  final int duration;
  final VoidCallback onComplete;
  final double width;
  final double height;
  final int progress;
  double borderWidth = 2;

  TimeIndicator(this.duration,
      this.progress,
      this.onComplete,
      {Key? key, this.width = 300, this.height = 25})
      : super(key: key);

  // @override
  // // ignore: no_logic_in_create_state
  // ConsumerState<TimeIndicator> createState() => _TimeIndicatorState(
  //     duration: duration,
  //     progress: progress,
  //     onComplete: onComplete,
  //     width: width,
  //     height: height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var percent = ((progress / duration) * 100) / 100;
    var innerWidth = ((width * percent) - borderWidth * 2);
    var innerHeight = height - borderWidth * 2;
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
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
            border: Border.all(
              width: borderWidth,
              // color: ThemeHelper.primaryColor
            ),
          ),
        ),
        Container(
          width: innerWidth,
          height: innerHeight,
          margin: EdgeInsets.all(borderWidth),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
            border: Border.all(
              width: 5,
              // color: ThemeHelper.accentColor
            ),
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
