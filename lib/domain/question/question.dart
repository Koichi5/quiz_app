import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../option/option.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question implements _$Question {
  const Question._();

  const factory Question({
    String? id,
    String? categoryDocRef,
    String? quizDocRef,
    String? questionDocRef,
    String? originalQuestionDocRef,
    required String text,
    required int duration,
    required bool optionsShuffled,
    required List<Option> options,
  }) = _Question;

  factory Question.empty() => const Question(
      text: '', duration: 0, optionsShuffled: false, options: []);

  factory Question.fromJson(json) => _$QuestionFromJson(json);

  factory Question.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Question.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
