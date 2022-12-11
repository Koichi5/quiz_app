import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/dto/quiz_result.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/screens/quiz_result_screen.dart';
import 'package:quiz_app/presentation/widgets/question_option.dart';
import 'package:quiz_app/presentation/widgets/time_indicator.dart';

import '../../application/quiz_engine.dart';
import '../../domain/option/option.dart';
import '../../domain/question/question.dart';
import '../../domain/quiz/quiz.dart';
import '../../general/general_provider.dart';
import '../controller/category_controller.dart';
import '../controller/quiz_history_controller.dart';

final remainTimeProvider = StateProvider<int>((ref) => 0);
final questionAnswerProvider =
    StateProvider<Map<int, bool>>((ref) => {0: false});
final optionGestureProvider = StateProvider((ref) => false);

class QuizScreen extends StatefulHookConsumerWidget {
  static const routeName = '/quiz';
  final Quiz quiz;
  final List<Question> questionList;

  const QuizScreen({required this.quiz, required this.questionList, Key? key})
      : super(key: key);

  @override
  ConsumerState<QuizScreen> createState() =>
      // ignore: no_logic_in_create_state
      _QuizScreenState(quiz: quiz, questionList: questionList);
}

class _QuizScreenState extends ConsumerState<QuizScreen>
    with WidgetsBindingObserver {
  static const routeName = '/quiz';
  late QuizEngine engine;
  final Quiz quiz;
  final List<Question> questionList;
  // final Reader reader;
  int _remainTime = 0;
  Question? question;
  Timer? progressTimer;
  AppLifecycleState? appState;

  _QuizScreenState({
    required this.quiz,
    required this.questionList,
  }) {
    engine = QuizEngine(
        quiz: quiz,
        questionList: questionList,
        onNext: onNextQuestion,
        onCompleted: onQuizComplete,
        onStop: onStop);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    engine.start(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appState = state;
    // print(state);
  }

  @override
  void dispose() {
    if (progressTimer != null && progressTimer!.isActive) {
      progressTimer!.cancel();
    }
    engine.stop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // alignment: Alignment.center,
      // padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            screenHeader(),
            quizQuestion(),
            questionOptions(),
            quizProgress(),
            footerButton(context),
          ],
        ),
      ),
    );
  }

  Widget screenHeader() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        quiz.title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Widget quizQuestion() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        question?.text ?? "",
      ),
    );
  }

  Widget questionOptions() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: List<Option>.from(question?.options ?? []).map((option) {
              int optionIndex = question!.options.indexOf(option);
              var optionWidget = GestureDetector(
                onTap: () {
                  if (!ref.watch(optionGestureProvider)) {
                    ref.watch(optionGestureProvider.notifier).state = true;
                    // print("optionIndex : $optionIndex");
                    // print(
                    // "question!.options[optionIndex].isSelected : ${question!.options[optionIndex].isSelected}");
                    setState(() {
                      // ref.watch(optionGestureProvider) ? (){} :
                      _remainTime = 0;
                      ref.watch(questionAnswerProvider.notifier).state =
                          engine.updateAnswer(
                              questionList.indexOf(question!), optionIndex);
                      // print(
                      //     "ref.watch(questionAnswerProvider.notifier).state : ${ref.watch(questionAnswerProvider.notifier).state}");
                      // print(
                      //     "question!.options[optionIndex].isSelected : ${question!.options[optionIndex].isSelected}");
                      // ref.watch(optionGestureProvider.notifier).state = true;
                      progressTimer!.cancel();
                    });

                    // 2.5秒後に次の問題へ
                    Future.delayed(const Duration(milliseconds: 2500), () {
                      engine.next();
                      // 何かしらの選択肢を選択したら true になる provider, 画面遷移時には次の問題へ移行するため、false にする必要がある
                      ref.watch(optionGestureProvider.notifier).state = false;
                    });

                    // question!.options[optionIndex].copyWith().isSelected = true;
                    // setState を置いておかないと画面が更新されないため、正誤判定が一回しかされない
                    // questionAnswer = engine.updateAnswer(questionList.indexOf(question!), optionIndex);
                    // for (int i = 0; i < question!.options.length; i++) {
                    //   question!.options[i].copyWith(isSelected: false);
                    // }
                  } else {
                    null;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: QuestionOption(
                    index: optionIndex,
                    optionText: question!.options[optionIndex].text,
                    isSelected: question!.options[optionIndex].isSelected,
                    optionIsCorrect:
                        ref.watch(questionAnswerProvider).values.last,
                  ),
                ),
              );
              return optionWidget;
            }).toList(),
          ),
        ),
        // option が選択されているかどうかの条件分岐 * 選択された選択肢が正しいかどうかの条件分岐
        // Icon の範囲が大きいため、テキストをタップしても Stack の下になって反応しないことがある
        // Icon から外れた部分であれば Tap が反応
        ref.watch(optionGestureProvider)
            ? ref.watch(questionAnswerProvider).values.last
                ? Icon(
                    Icons.circle_outlined,
                    size: MediaQuery.of(context).size.width * 0.7,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Icon(
                    Icons.close,
                    size: MediaQuery.of(context).size.width * 0.7,
                    color: Theme.of(context).colorScheme.error,
                  )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }

  Widget quizProgress() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: question != null
                ? TimeIndicator(
                    question!.duration,
                    _remainTime,
                    () {
                      // progressTimer!.cancel();
                      // _remainTime = 0;
                    },
                  )
                : null,
          ),
          Text(
            "$_remainTime秒",
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget footerButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                engine.stop();
                ref.watch(optionGestureProvider.notifier).state = false;
                ref.watch(questionAnswerProvider.notifier).state = {0: false};
                if (progressTimer != null && progressTimer!.isActive) {
                  progressTimer!.cancel();
                }
              });
              Navigator.pop(context);
            },
            child: const Text(
              "キャンセル",
              style: TextStyle(fontSize: 20),
            )),
        // ElevatedButton(
        //   onPressed: () {
        //     engine.next();
        //     // 何かしらの選択肢を選択したら true になる provider, 画面遷移時には次の問題へ移行するため、false にする必要がある
        //     ref.watch(optionGestureProvider.notifier).state = false;
        //   },
        //   child: const Text(
        //     "次へ",
        //     style: TextStyle(fontSize: 20),
        //   ),
        // ),
      ],
    );
  }

  void onNextQuestion(Question inputQuestion) {
    setState(() {
      if (progressTimer != null && progressTimer!.isActive) {
        _remainTime = 0;
        progressTimer!.cancel();
      }
      question = inputQuestion;
      _remainTime = inputQuestion.duration;
      for (int i = 0; i < inputQuestion.options.length; i++) {
        inputQuestion.options[i].copyWith(text: "");
      }
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainTime >= 0) {
        try {
          if (mounted) {
            setState(() {
              progressTimer = timer;
              _remainTime--;
            });
            // print(_remainTime);
          }
        } catch (e) {
          timer.cancel();
          throw CustomException(message: e.toString());
        }
      }
    });
  }

  void onQuizComplete(
    // Quiz quiz,
    BuildContext context,
    double total,
    Duration takenTime,
    List<int> takenQuestions,
    List<bool> answerIsCorrectList,
  ) {
    if (mounted) {
      setState(() {
        _remainTime = 0;
        progressTimer!.cancel();
      });
    }
    // progressTimer!.cancel();
    // print("quiz.categoryDocRef : ${quiz.categoryDocRef}");
    // Navigator.pop(context);
    ref
        .watch(categoryControllerProvider.notifier)
        .retrieveCategoryById(quizCategoryDocRef: quiz.categoryDocRef!)
        .then((category) =>
            ref.watch(quizHistoryControllerProvider.notifier).addQuizHistory(
                  user: ref.watch(firebaseAuthProvider).currentUser!,
                  quizDocRef: quiz.quizDocRef!,
                  categoryDocRef: quiz.categoryDocRef!,
                  quizTitle: quiz.title,
                  score: "$total/${questionList.length}",
                  timeTaken: "${takenTime.inMinutes}分${takenTime.inSeconds}秒",
                  quizDate: DateTime.now(),
                  status: "Complete",
                  takenQuestions: takenQuestions,
                  answerIsCorrectList: answerIsCorrectList,
                ));
    // push にすると、この画面は単一の画面ではないため、画面遷移が乱れる
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => QuizResultScreen(
                  result: QuizResult(
                      quiz: quiz,
                      questionList: questionList,
                      totalCorrect: total),
                  takenQuestions: takenQuestions,
                answerIsCorrectList: answerIsCorrectList
                )));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => QuizResultScreen(
    //             result: QuizResult(
    //                 quiz: quiz,
    //                 questionList: questionList,
    //                 totalCorrect: total))));
  }

  void onStop(Quiz quiz) {
    _remainTime = 0;
    progressTimer?.cancel();
  }
}

// @override
// Widget build(BuildContext context) {
//   var percent = ((progress / duration) * 100) / 100;
//   var innerWidth = ((width * percent) - borderWidth * 2);
//   var innerHeight = height - borderWidth * 2;
//   if (innerWidth < 0) {
//     innerWidth = 0;
//   }
//   if (innerHeight < 0) {
//     innerHeight = 0;
//   }
//   return Stack(
//     children: [
//       Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
//           border: Border.all(
//             width: borderWidth,
//             // color: ThemeHelper.primaryColor
//           ),
//         ),
//       ),
//       Container(
//         width: innerWidth,
//         height: innerHeight,
//         margin: EdgeInsets.all(borderWidth),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
//           border: Border.all(
//             width: 5,
//             // color: ThemeHelper.accentColor
//           ),
//           // color: ThemeHelper.accentColor
//         ),
//       ),
//     ],
//   );
// }
