import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiz_app/domain/question/question.dart';

part 'quiz_history.freezed.dart';
part 'quiz_history.g.dart';

@freezed
abstract class QuizHistory implements _$QuizHistory {
  QuizHistory._();

  factory QuizHistory({
    required String id,
    @Default(0) int quizId,
    @Default(0) int categoryId,
    @Default("") String quizTitle,
    @Default("") String score,
    @Default("") String timeTaken,
    required DateTime quizDate,
    @Default("") String status,
  }) = _QuizHistory;

  factory QuizHistory.empty() => QuizHistory(
    id: "",
    quizId: 0,
    categoryId: 0,
    quizTitle: "",
    score: "",
    timeTaken: "",
    quizDate: DateTime.now(),
    status: "",
  );

  factory QuizHistory.fromJson(json) => _$QuizHistoryFromJson(json);

  factory QuizHistory.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return QuizHistory.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
