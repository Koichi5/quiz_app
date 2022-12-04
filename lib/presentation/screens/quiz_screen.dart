import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/widgets/question_option.dart';
import 'package:quiz_app/presentation/widgets/time_indicator.dart';

import '../../application/quiz_engine.dart';
import '../../domain/option/option.dart';
import '../../domain/question/question.dart';
import '../../domain/quiz/quiz.dart';
import '../../general/general_provider.dart';
import '../controller/category_controller.dart';
import '../controller/quiz_history_controller.dart';

final remainTimeProvider = StateProvider<int> ((ref) => 0);

class QuizScreen extends StatefulHookConsumerWidget {
  static const routeName = '/quiz';
  final Quiz quiz;
  final List<Question> questionList;

  const QuizScreen({required this.quiz, required this.questionList, Key? key}) : super(key: key);

  @override
  ConsumerState<QuizScreen> createState() =>
      // ignore: no_logic_in_create_state
      _QuizScreenState(
          quiz: quiz, questionList: questionList
      );
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
  }){
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
    engine.start();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appState = state;
    print(state);
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
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
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
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: List<Option>.from(question?.options ?? []).map((option) {
          int optionIndex = question!.options.indexOf(option);
          var optionWidget = GestureDetector(
            onTap: () {
              print("optionIndex : $optionIndex");
              setState(() {
                final answerIsCorrect = engine.updateAnswer(questionList.indexOf(question!), optionIndex);
                print(answerIsCorrect);
                for (int i = 0; i < question!.options.length; i++) {
                  question!.options[i].copyWith(isSelected: false);
                }
              });
            },
            child: QuestionOption(
              optionIndex,
              question!.options[optionIndex].text,
              question!.options[optionIndex].text,
              isSelected: question!.options[optionIndex].isSelected,
            ),
          );
          return optionWidget;
        }).toList(),
      ),
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
                    question!.duration, _remainTime, () {})
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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  engine.stop();
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
          ElevatedButton(
            onPressed: () {
              engine.next();
            },
            child: const Text(
              "次へ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
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
          progressTimer = timer;
          _remainTime--;
          print(_remainTime);
          }
        } catch (e) {
          timer.cancel();
          throw CustomException(message: e.toString());
        }
      }
    });
  }

  void onQuizComplete(
    Quiz quiz,
    double total,
    Duration takenTime,
  ) {
    if (mounted) {
      _remainTime = 0;
    }
    progressTimer!.cancel();
    ref.watch(categoryControllerProvider.notifier)
        .retrieveCategoryById(quizCategoryDocRef: quiz.categoryDocRef!)
        .then((category) => ref.watch(quizHistoryControllerProvider.notifier)
            .addQuizHistory(
                user: ref.watch(firebaseAuthProvider).currentUser!,
                quizDocRef: quiz.quizDocRef!,
                categoryDocRef: quiz.categoryDocRef!,
                quizTitle: quiz.title,
                score: "$total/${quiz.questions!.length}",
                timeTaken: "${takenTime.inMinutes}分${takenTime.inSeconds}秒",
                quizDate: DateTime.now(),
                status: "Complete"));
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