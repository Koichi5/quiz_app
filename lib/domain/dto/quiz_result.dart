import 'package:freezed_annotation/freezed_annotation.dart';

import '../question/question.dart';
import '../quiz/quiz.dart';

part 'quiz_result.freezed.dart';

@freezed
class QuizResult with _$QuizResult {
  const factory QuizResult({
    required List<Question> questionList,
    required double totalCorrect,
  }) = _QuizResult;
}