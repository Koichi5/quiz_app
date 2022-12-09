import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weak_question.freezed.dart';
part 'weak_question.g.dart';

@freezed
abstract class WeakQuestion implements _$WeakQuestion {
  WeakQuestion._();

  factory WeakQuestion({
    String? id,
    required String categoryDocRef,
    required String quizDocRef,
    required String questionDocRef,
  }) = _WeakQuestion;

  factory WeakQuestion.empty() => WeakQuestion(
        categoryDocRef: "",
        quizDocRef: "",
        questionDocRef: "",
      );

  factory WeakQuestion.fromJson(json) => _$WeakQuestionFromJson(json);

  factory WeakQuestion.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return WeakQuestion.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
