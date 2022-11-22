import 'dart:async';
import 'dart:math';

import '../domain/question/question.dart';
import '../domain/quiz/quiz.dart';

typedef OnQuizNext = void Function(Question question);
typedef OnQuizCompleted = void Function(
    Quiz quiz, double totalScore, Duration takenTime);
typedef OnQuizStop = void Function(Quiz quiz);

class QuizEngine {
  int questionIndex = 0;
  int questionDuration = 0;
  bool isRunning = false;
  bool takeNewQuestion = true;
  DateTime examStartTime = DateTime.now();
  DateTime questionStartTime = DateTime.now();

  Quiz quiz;
  List<int> takenQuestions = [];
  Map<int, bool> questionAnswer = {};

  OnQuizNext onNext;
  OnQuizCompleted onCompleted;
  OnQuizStop onStop;

  QuizEngine(this.quiz, this.onNext, this.onCompleted, this.onStop);

  void start() {
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
          question = _nextQuestion(quiz, questionIndex);
          if (question != null) {
            takeNewQuestion = false;
            questionIndex++;
            questionStartTime = DateTime.now();
            onNext(question);
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

        if (question == null ||
            quiz.questions!.length == questionAnswer.length) {
          double totalCorrect = 0.0;
          questionAnswer.forEach((key, value) {
            if (value == true) {
              totalCorrect++;
            }
          });
          var takenTime = examStartTime.difference(DateTime.now());
          onCompleted(quiz, totalCorrect, takenTime);
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

  void updateAnswer(int questionIndex, int answer) {
    var question = quiz.questions![questionIndex];
    questionAnswer[questionIndex] = question.options![answer].isCorrect;
  }

  Question? _nextQuestion(Quiz quiz, int index) {
    while (true) {
      if (takenQuestions.length >= quiz.questions!.length) {
        return null;
      }
      // Change quiz.optionsShuffled to quiz.questionShuffled
      if (quiz.questionsShuffled) {
        index = Random().nextInt(quiz.questions!.length);
        if (takenQuestions.contains(index) == false) {
          takenQuestions.add(index);
          return quiz.questions![index];
        }
      } else {
        return quiz.questions![index];
      }
    }
  }
}