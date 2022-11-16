import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiz_app/domain/question/question.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
abstract class Quiz implements _$Quiz {
  const Quiz._();

  const factory Quiz({
    required int id,
    String? categoryDocRef,
    String? quizDocRef,
    required String title,
    required String description,
    required bool questionsShuffled,
    required String imagePath,
    required int categoryId,
    required List<Question> questions,
  }) = _Quiz;

  factory Quiz.empty() => const Quiz(
        id: 0,
        // categoryDocRef: "",
        // quizDocRef: "",
        title: "",
        description: "",
        questionsShuffled: false,
        imagePath: "",
        categoryId: 0,
        questions: [],
      );

  factory Quiz.fromJson(json) => _$QuizFromJson(json);

  factory Quiz.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Quiz.fromJson(data).copyWith(id: int.parse(doc.id));
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
