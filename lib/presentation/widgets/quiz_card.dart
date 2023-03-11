// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../domain/quiz/quiz.dart';
//
// class QuizCard extends HookConsumerWidget {
//   const QuizCard({required this.quiz, Key? key}) : super(key: key);
//
//   final Quiz quiz;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () {},
//       child: Card(
//         key: ValueKey(quiz.id),
//         color: Theme.of(context).colorScheme.primary,
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: CachedNetworkImage(
//                   width: double.infinity,
//                   imageUrl: quiz.imagePath!,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Flexible(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         quiz.title,
//                         style: const TextStyle(fontSize: 20),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                       )),
//                 ),
//               ),
//               Text(quiz.description)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
