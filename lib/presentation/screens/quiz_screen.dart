import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/widgets/question_option.dart';
import 'package:quiz_app/presentation/widgets/time_indicator.dart';

import '../../application/quiz_engine.dart';
// import '../../domain/option/option.dart';
import '../../domain/option/option.dart';
import '../../domain/question/question.dart';
import '../../domain/quiz/quiz.dart';
import '../../general/general_provider.dart';
import '../controller/category_controller.dart';
import '../controller/quiz_history_controller.dart';

final remainTimeProvider = StateProvider((ref) => 0);

class QuizScreen extends HookConsumerWidget with WidgetsBindingObserver {
  static const routeName = '/quiz';
  late QuizEngine engine;
  final Quiz quiz;
  final List<Question> questionList;
  final Reader reader;
  int _remainTime = 0;
  Question? question;
  Timer? progressTimer;
  AppLifecycleState? appState;

  QuizScreen(
      {required this.quiz,
      required this.questionList,
      required this.reader,
      Key? key})
      : super(key: key) {
    engine = QuizEngine(
        quiz: quiz,
        questionList: questionList,
        onNext: onNextQuestion,
        onCompleted: onQuizComplete,
        onStop: onStop);
  }

  //@override
  void initState() {
    engine.start();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appState = state;
    print(state);
  }

  // @override
  void dispose() {
    if (progressTimer != null && progressTimer!.isActive) {
      progressTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
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
              engine.updateAnswer(questionList.indexOf(question!), optionIndex);
              for (int i = 0; i < question!.options.length; i++) {
                question!.options[i].copyWith();
              }
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
            child: question != null ? TimeIndicator(question!.duration, reader(remainTimeProvider), () {}) : SizedBox(),
          ),
          Text(
            "${reader(remainTimeProvider)}秒",
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
                engine.stop();
                if (progressTimer != null && progressTimer!.isActive) {
                  progressTimer!.cancel();
                }
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
    if (progressTimer != null && progressTimer!.isActive) {
      reader(remainTimeProvider.notifier).state = 0;
      progressTimer!.cancel();
    }
    question = inputQuestion;
    reader(remainTimeProvider.notifier).state = inputQuestion.duration;
    for (int i = 0; i < inputQuestion.options.length; i++) {
      // inputQuestion.options[i].copyWith(text: "");
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (reader(remainTimeProvider) >= 0) {
        try {
          // if (mounted) {
          progressTimer = timer;
          reader(remainTimeProvider.notifier).state--;
          // }
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
      WidgetRef ref,
  ) {
    if (mounted) {
    reader(remainTimeProvider.notifier).state = 0;
    }
    progressTimer!.cancel();
    reader(categoryControllerProvider.notifier)
        .retrieveCategoryById(quizCategoryDocRef: quiz.categoryDocRef!)
        .then((category) => reader(quizHistoryControllerProvider.notifier)
            .addQuizHistory(
                user: reader(firebaseAuthProvider).currentUser!,
                quizDocRef: quiz.quizDocRef!,
                categoryDocRef: quiz.categoryDocRef!,
                quizTitle: quiz.title,
                score: "$total/${quiz.questions!.length}",
                timeTaken: "${takenTime.inMinutes}分${takenTime.inSeconds}秒",
                quizDate: DateTime.now(),
                status: "Complete"));
  }

  void onStop(Quiz quiz) {
    reader(remainTimeProvider.notifier).state = 0;
    progressTimer?.cancel();
  }
}



