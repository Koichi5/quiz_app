import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/category/category.dart';

import '../domain/question/question.dart';
import '../presentation/screens/quiz_screen.dart';

typedef OnQuizNext = void Function(Question question);
typedef OnQuizCompleted = void Function(
  BuildContext context,
  Category? category,
  double totalScore,
  Duration takenTime,
  List<int> takenQuestions,
  List<bool> answerIsCorrectList,
);
typedef OnQuizStop = void Function();

class QuizEngine {
  int questionIndex = 0;
  int questionDuration = 0;
  bool isRunning = false;
  bool takeNewQuestion = true;
  DateTime examStartTime = DateTime.now();
  DateTime questionStartTime = DateTime.now();
  Reader reader;

  Category? category;
  final List<Question> questionList;
  List<int> takenQuestions = [];
  Map<int, bool> questionAnswer = {};

  OnQuizNext onNext;
  OnQuizCompleted onCompleted;
  OnQuizStop onStop;

  QuizEngine(
      {required this.reader,
      this.category,
      required this.questionList,
      required this.onNext,
      required this.onCompleted,
      required this.onStop});

  void start(BuildContext context) {
    questionIndex = 0;
    questionDuration = 0;
    takenQuestions = [];
    questionAnswer = {};
    isRunning = true;
    takeNewQuestion = true;

    Future.doWhile(() async {
      Question? question;
      questionStartTime = DateTime.now();
      examStartTime = DateTime.now();

      do {
        if (takeNewQuestion) {
          question = _nextQuestion(questionList, questionIndex);
          if (question != null) {
            takeNewQuestion = false;
            questionIndex++;
            questionStartTime = DateTime.now();
            onNext(question);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              reader(optionGestureProvider.notifier).state = false;
            });
          }
        }
        if (question != null) {
          var questionTimeEnd =
              questionStartTime.add(Duration(seconds: question.duration));
          var timeDiff = questionTimeEnd.difference(DateTime.now()).inSeconds;
          if (timeDiff <= 0) {
            questionAnswer = updateAnswer(
              questionIndex: questionIndex,
            );
            if (questionAnswer.keys.length == questionList.length) {
              stop();
              double totalCorrect = 0.0;
              questionAnswer.forEach(
                (key, value) {
                  if (value == true) {
                    totalCorrect++;
                  }
                },
              );
              var takenTime = examStartTime.difference(DateTime.now());
              onCompleted(context, category, totalCorrect, takenTime,
                  takenQuestions, questionAnswer.values.toList());
              reader(currentQuestionIndexProvider.notifier).state = 1;
            } else {
              takeNewQuestion = true;
            }
          }
        }
        if (question == null) {
          stop();
          double totalCorrect = 0.0;
          questionAnswer.forEach(
            (key, value) {
              if (value == true) {
                totalCorrect++;
              }
            },
          );
          var takenTime = examStartTime.difference(DateTime.now());
          onCompleted(context, category, totalCorrect, takenTime,
              takenQuestions, questionAnswer.values.toList());
          reader(currentQuestionIndexProvider.notifier).state = 1;
        }
        await Future.delayed(const Duration(milliseconds: 500));
      } while (question != null && isRunning);
      return false;
    });
  }

  void stop() {
    takeNewQuestion = false;
    isRunning = false;
    onStop();
  }

  void next() {
    takeNewQuestion = true;
  }

  Map<int, bool> updateAnswer({required int questionIndex, int? answer}) {
    var question = questionList[questionIndex];
    if (answer == null) {
      questionAnswer[questionIndex] = false;
      reader(currentQuestionIndexProvider.notifier).state++;
      return questionAnswer;
    } else {
      questionAnswer[questionIndex] = question.options[answer].isCorrect;
      return questionAnswer;
    }
  }

  Question? _nextQuestion(List<Question> questionList, int index) {
    while (true) {
      if (takenQuestions.length == questionList.length) {
        return null;
      }
      index = Random().nextInt(questionList.length);
      if (questionAnswer.keys.contains(index) == false) {
        takenQuestions.add(index);
        return questionList[index];
      }
    }
  }
}
