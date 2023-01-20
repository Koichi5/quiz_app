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
      // required this.quiz,
      required this.questionList,
      required this.onNext,
      required this.onCompleted,
      required this.onStop});

  void start(BuildContext context) {
    print("engine started");
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
            // 連打対策のため必要
            WidgetsBinding.instance.addPostFrameCallback((_) {
              reader(optionGestureProvider.notifier).state = false;
            });
            // reader(currentQuestionIndexProvider.notifier).state = questionIndex;
            // reader(remainTimeProvider) == 0 ?
            //   updateAnswer(
            //       questionIndex: questionList.indexOf(question),) : null;
            // updateAnswer(
            //     questionIndex: questionList.indexOf(question),);
            print("questionIndex1 : $questionIndex");
            print("question : ${question}");
            // reader(currentQuestionIndexProvider.notifier).state = questionIndex;
          }
        }
        if (question != null) {
          var questionTimeEnd =
              questionStartTime.add(Duration(seconds: question.duration));
          var timeDiff = questionTimeEnd.difference(DateTime.now()).inSeconds;
          if (timeDiff <= 0) {
            // 未回答の場合は updateAnswer で answer : null
            questionAnswer = updateAnswer(
              questionIndex: questionIndex,
            );
            print("制限時間が過ぎました");
            if(questionAnswer.keys.length == questionList.length) {
              print("最終問題で制限時間が過ぎました");
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
              print("takenQuestions : $takenQuestions");
              onCompleted(context, category, totalCorrect, takenTime,
                  takenQuestions, questionAnswer.values.toList());
              reader(currentQuestionIndexProvider.notifier).state = 1;
            } else {
              takeNewQuestion = true;
            }
          }
        }
        //　_nextQuestion関数でとってきたクイズが null だった時 ＝ クイズが終わった時
        if (question == null) {
          print("question : $question");
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
          print("takenQuestions : $takenQuestions");
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
    print("update answer");
    print("questionIndex : ${questionIndex}");
    var question = questionList[questionIndex];
    // final answerIsCorrect = questionAnswer[questionIndex] == question.options[answer].isCorrect;
    if (answer == null) {
      questionAnswer[questionIndex] = false;
      reader(currentQuestionIndexProvider.notifier).state++;
      print("answer :$answer");
      print("questionAnswer : ${questionAnswer}");
      print("questionAnswer[questionIndex] : ${questionAnswer[questionIndex]}");
      print("未回答です");
      // next();
      return questionAnswer;
    } else {
      questionAnswer[questionIndex] = question.options[answer].isCorrect;
      print("answer :$answer");
      print("questionAnswer : ${questionAnswer}");
      print("questionAnswer[questionIndex] : ${questionAnswer[questionIndex]}");
      // print("questionAnswer.values : ${questionAnswer.values}");
      // print("questionAnswer.values.last : ${questionAnswer.values.last}");
      // reader(currentQuestionIndexProvider.notifier).state++;
      return questionAnswer;
    }
    // questionAnswer は Map<int, bool>
    // keys には Question の番号
    // values には正誤判定
    print("answer :$answer");
    print("questionAnswer : ${questionAnswer}");
    print("questionAnswer.values : ${questionAnswer.values}");
    print("questionAnswer.values.last : ${questionAnswer.values.last}");
    return questionAnswer;
  }

  Question? _nextQuestion(List<Question> questionList, int index) {
    while (true) {
      if (takenQuestions.length == questionList.length) {
        return null;
      }
      // Change quiz.optionsShuffled to quiz.questionShuffled
      // if (!quiz.questionsShuffled) {
      index = Random().nextInt(questionList.length);
      if (questionAnswer.keys.contains(index) == false) {
        takenQuestions.add(index);
        return questionList[index];
      }
      // } else {
      //   return questionList[index];
      // }
    }
  }
}
