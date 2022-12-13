import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiz_app/domain/question/question.dart';

part 'quiz_history.freezed.dart';
part 'quiz_history.g.dart';

@freezed
abstract class QuizHistory implements _$QuizHistory {
  QuizHistory._();

  factory QuizHistory({
    String? id,
    // @Default(0) required int quizId,
    // @Default(0) required int categoryId,
    required String categoryDocRef,
    required String quizDocRef,
    required String quizTitle,
    required int score,
    required int questionCount,
    required int timeTakenMinutes,
    required int timeTakenSeconds,
    required DateTime quizDate,
    required String status,
    required List<int> takenQuestions,
    required List<bool> answerIsCorrectList,
  }) = _QuizHistory;

  factory QuizHistory.empty() => QuizHistory(
        // quizId: 0,
        // categoryId: 0,
        categoryDocRef: "",
        quizDocRef: "",
        quizTitle: "",
        score: 0,
        questionCount: 0,
        timeTakenMinutes: 0,
        timeTakenSeconds: 0,
        quizDate: DateTime.now(),
        status: "",
        takenQuestions: [],
      answerIsCorrectList: [],
      );

  factory QuizHistory.fromJson(json) => _$QuizHistoryFromJson(json);

  factory QuizHistory.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return QuizHistory.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
