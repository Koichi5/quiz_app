import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/domain/category/category.dart';

import '../domain/question/question.dart';
import '../domain/quiz/quiz.dart';

typedef OnQuizNext = void Function(Question question);
typedef OnQuizCompleted = void Function(
    BuildContext context,
    Category category,
    double totalScore,
    Duration takenTime,
    List<int> takenQuestions,
    List<bool> answerIsCorrectList,
    );
typedef OnQuizStop = void Function(Quiz quiz);

class QuizEngine {
  int questionIndex = 0;
  int questionDuration = 0;
  bool isRunning = false;
  bool takeNewQuestion = true;
  DateTime examStartTime = DateTime.now();
  DateTime questionStartTime = DateTime.now();

  final Category category;
  final Quiz quiz;
  final List<Question> questionList;
  List<int> takenQuestions = [];
  Map<int, bool> questionAnswer = {};

  OnQuizNext onNext;
  OnQuizCompleted onCompleted;
  OnQuizStop onStop;

  QuizEngine(
      {
        required this.category,
        required this.quiz,
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
          question = _nextQuestion(quiz, questionList, questionIndex);
          if (question != null) {
            takeNewQuestion = false;
            questionIndex++;
            questionStartTime = DateTime.now();
            onNext(question);
            print("questionIndex : $questionIndex");
          }
        }
        if (question != null) {
          var questionTimeEnd =
              questionStartTime.add(Duration(seconds: question.duration));
          var timeDiff = questionTimeEnd.difference(DateTime.now()).inSeconds;
          if (timeDiff <= 0) {
            takeNewQuestion = true;
          }
        }
        //　_nextQuestion関数でとってきたクイズが null だった時 ＝ クイズが終わった時
        if (question == null || questionList.length == questionAnswer.length) {
          double totalCorrect = 0.0;
          questionAnswer.forEach((key, value) {
            if (value == true) {
              totalCorrect++;
            }
          });
          var takenTime = examStartTime.difference(DateTime.now());
          print("takenQuestions : $takenQuestions");
          onCompleted(context, category, totalCorrect, takenTime, takenQuestions, questionAnswer.values.toList());
        }
        await Future.delayed(const Duration(milliseconds: 500));
      } while (question != null && isRunning);
      return false;
    });
  }

  void stop() {
    takeNewQuestion = false;
    isRunning = false;
    onStop(quiz);
  }

  void next() {
    takeNewQuestion = true;
  }

  Map<int, bool> updateAnswer({required int questionIndex, required int answer}) {
    var question = questionList[questionIndex];
    // final answerIsCorrect = questionAnswer[questionIndex] == question.options[answer].isCorrect;
    questionAnswer[questionIndex] = question.options[answer].isCorrect;
    // questionAnswer は Map<int, bool>
    // keys には Question の番号
    // values には正誤判定
    // print("questionAnswer : ${questionAnswer}");
    // print("questionAnswer.values : ${questionAnswer.values}");
    // print("questionAnswer.values.last : ${questionAnswer.values.last}");
    return questionAnswer;
  }

  Question? _nextQuestion(Quiz quiz, List<Question> questionList, int index) {
    while (true) {
      if (takenQuestions.length >= questionList.length) {
        return null;
      }
      // Change quiz.optionsShuffled to quiz.questionShuffled
      // if (!quiz.questionsShuffled) {
      index = Random().nextInt(questionList.length);
      if (takenQuestions.contains(index) == false) {
        takenQuestions.add(index);
        return questionList[index];
      }
      // } else {
      //   return questionList[index];
      // }
    }
  }
}
