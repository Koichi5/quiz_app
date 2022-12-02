// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/presentation/controller/category_controller.dart';
// import 'package:quiz_app/presentation/controller/quiz_controller.dart';
// import 'package:quiz_app/presentation/controller/quiz_history_controller.dart';
// import 'package:quiz_app/presentation/screens/quiz_result_screen.dart';
//
// import '../../application/quiz_engine.dart';
// import '../../domain/dto/option_selection.dart';
// import '../../domain/dto/quiz_result.dart';
// import '../../domain/option/option.dart';
// import '../../domain/question/question.dart';
// import '../../domain/quiz/quiz.dart';
// import '../../domain/quiz_history/quiz_history.dart';
// import '../../general/general_provider.dart';
// import '../widgets/question_option.dart';
// import '../widgets/time_indicator.dart';
//
// class QuizScreen2 extends ConsumerStatefulWidget {
//   static const routeName = '/quiz';
//   final Quiz quiz;
//   final List<Question> questionList;
//   QuizScreen2(this.quiz, this.questionList, {Key? key}) : super(key: key);
//
//   @override
//   _QuizScreenState2 createState() => _QuizScreenState2(quiz, questionList);
// }
//
// class _QuizScreenState2 extends ConsumerState<QuizScreen2>
//     with WidgetsBindingObserver {
//   late QuizEngine engine;
//   // late QuizStore store;
//   late Quiz quiz;
//   late List<Question> questionList;
//   Timer? progressTimer;
//   AppLifecycleState? state;
//
//   int _remainingTime = 0;
//   // Map<int, OptionSelection> _optionSerial = {};
//
//   _QuizScreenState2(this.quiz, this.questionList) {
//     // store = QuizStore();
//     engine = QuizEngine(quiz, questionList, onNextQuestion, onQuizComplete, onStop);
//   }
//
//   @override
//   void initState() {
//     engine.start();
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     this.state = state;
//   }
//
//   @override
//   void dispose() {
//     if (progressTimer != null && progressTimer!.isActive) {
//       progressTimer!.cancel();
//     }
//     engine.stop();
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(10),
//           // decoration: ThemeHelper.fullScreenBgBoxDecoration(),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 screenHeader(),
//                 quizQuestion(),
//                 questionOptions(),
//                 quizProgress(),
//                 footerButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget screenHeader() {
//     return Container(
//       alignment: Alignment.center,
//       child: Text(
//         quiz.title,
//         style: Theme.of(context).textTheme.headline3,
//       ),
//     );
//   }
//
//   Widget quizQuestion() {
//     return Container(
//       alignment: Alignment.centerLeft,
//       padding: EdgeInsets.all(20),
//       margin: EdgeInsets.only(bottom: 10),
//       // decoration: ThemeHelper.roundBoxDeco(),
//       child: Text(
//         questionList[0].text ?? "",
//         style: Theme.of(context).textTheme.headline5,
//       ),
//     );
//   }
//
//   Widget questionOptions() {
//     return Container(
//       alignment: Alignment.center,
//       // decoration: ThemeHelper.roundBoxDeco(),
//       child: Column(
//         children: List<Option>.from(questionList[0].options).map((option) {
//           int optionIndex = questionList[0].options.indexOf(option);
//           var optWidget = GestureDetector(
//             onTap: () {
//               setState(() {
//                 engine.updateAnswer(
//                     questionList.indexOf(questionList[0]), optionIndex);
//                 for (int i = 0; i < questionList[0].options.length; i++) {
//                   // questionList[0].options[i].isSelected = false;
//                 }
//                 // questionList[0].options.update(optionIndex, (value) {
//                 //   value.isSelected = true;
//                 //   return value;
//                 // });
//               });
//             },
//             child: QuestionOption(
//               optionIndex,
//               questionList[0].options[optionIndex].text,
//               option.text,
//               isSelected: questionList[0].options[optionIndex].isSelected,
//             ),
//           );
//           return optWidget;
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget quizProgress() {
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20),
//             child: TimeIndicator(
//               questionList[0].duration,
//               _remainingTime,
//               () {},
//             ),
//           ),
//           Text(
//             "$_remainingTime Seconds",
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget footerButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               engine.stop();
//               if (progressTimer != null && progressTimer!.isActive) {
//                 progressTimer!.cancel();
//               }
//             });
//             Navigator.pop(context);
//           },
//           child: Text(
//             "Cancel",
//             style: TextStyle(fontSize: 20),
//           ),
//           // width: 130,
//           // height: 50,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             engine.next();
//           },
//           child: Text(
//             "Next",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           // isActive: true,
//           // width: 130,
//           // height: 50,
//         ),
//       ],
//     );
//   }
//
//   void onNextQuestion(Question question) {
//     setState(() {
//       if (progressTimer != null && progressTimer!.isActive) {
//         _remainingTime = 0;
//         progressTimer!.cancel();
//       }
//
//       questionList[0] = question;
//       _remainingTime = question.duration;
//       question.options = [];
//       for (var i = 0; i < question.options.length; i++) {
//         question.options[i] = OptionSelection(String.fromCharCode(65 + i), false);
//       }
//     });
//
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_remainingTime >= 0) {
//         try {
//           if (mounted) {
//             setState(() {
//               progressTimer = timer;
//               _remainingTime--;
//             });
//           }
//         } catch (ex) {
//           timer.cancel();
//           print(ex.toString());
//         }
//       }
//     });
//   }
//
//   void onQuizComplete(Quiz quiz, double total, Duration takenTime) {
//     if (mounted) {
//       setState(() {
//         _remainingTime = 0;
//       });
//     }
//     progressTimer!.cancel();
//     ref
//         .watch(categoryControllerProvider.notifier)
//         .retrieveCategoryById(quizCategoryDocRef: quiz.categoryDocRef!)
//         .then((category) => ref
//             .read(quizHistoryControllerProvider.notifier)
//             .addQuizHistory(
//                 user: ref.watch(firebaseAuthProvider).currentUser!,
//                 quizDocRef: quiz.quizDocRef!,
//                 categoryDocRef: quiz.categoryDocRef!,
//                 quizTitle: quiz.title,
//                 score: "$total/${quiz.questions!.length}",
//                 timeTaken: "${takenTime.inMinutes}分${takenTime.inSeconds}秒",
//                 quizDate: DateTime.now(),
//                 status: "Complete"));
//     // store.getCategoryAsync(quiz.categoryId).then((category) {
//     //   store
//     //       .saveQuizHistory(QuizHistory(
//     //     quizId: quiz.categoryId,
//     //     categoryId: category.id,
//     //     quizTitle: quiz.title,
//     //     score: "$total/${quiz.questions!.length}",
//     //     timeTaken: "${takenTime.inMinutes}分${takenTime.inSeconds}秒",
//     //     status: "Complete",
//     //     quizDate: DateTime.now(),
//     //   ))
//     //       .then((value) {
//     //     Navigator.pushReplacementNamed(context, QuizResultScreen.routeName,
//     //         arguments: QuizResult(quiz, total));
//     //   });
//     // });
//   }
//
//   void onStop(Quiz quiz) {
//     _remainingTime = 0;
//     progressTimer!.cancel();
//   }
// }
