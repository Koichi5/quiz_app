import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../question/question.dart';
import '../weak_question/weak_question.dart';

part 'weak_question_list.freezed.dart';
part 'weak_question_list.g.dart';

@freezed
abstract class WeakQuestionList implements _$WeakQuestionList {
  WeakQuestionList._();

  factory WeakQuestionList({
    String? id,
    required final List<Question> weakQuestionList,
    @Default(false) bool isLoading,
    final String? error,
  }) = _WeakQuestionList;

  factory WeakQuestionList.empty() => WeakQuestionList(
    weakQuestionList: [],
  );

  factory WeakQuestionList.fromJson(json) => _$WeakQuestionListFromJson(json);

  factory WeakQuestionList.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return WeakQuestionList.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}