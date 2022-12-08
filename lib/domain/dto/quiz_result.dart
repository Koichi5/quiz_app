import 'package:quiz_app/domain/question/question.dart';

import '../quiz/quiz.dart';

class QuizResult {
  Quiz quiz;
  List<Question> questionList;
  double totalCorrect;
  QuizResult(this.quiz, this.questionList, this.totalCorrect);
}