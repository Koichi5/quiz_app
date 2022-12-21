import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiz_app/domain/question/question.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
abstract class Quiz implements _$Quiz {
  const Quiz._();

  const factory Quiz({
    String? id,
    required int categoryId,
    String? categoryDocRef,
    String? quizDocRef,
    String? questionDocRef,
    required String title,
    required String description,
    required bool questionsShuffled,
    String? imagePath,
    List<Question>? questions,
  }) = _Quiz;

  factory Quiz.empty() => const Quiz(
        categoryId: 0,
        title: "",
        description: "",
        questionsShuffled: false,
      );

  factory Quiz.fromJson(json) => _$QuizFromJson(json);

  factory Quiz.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Quiz.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
