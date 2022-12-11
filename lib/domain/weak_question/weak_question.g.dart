// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weak_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeakQuestion _$$_WeakQuestionFromJson(Map<String, dynamic> json) =>
    _$_WeakQuestion(
      id: json['id'] as String?,
      categoryDocRef: json['categoryDocRef'] as String,
      quizDocRef: json['quizDocRef'] as String,
      questionDocRef: json['questionDocRef'] as String,
      weakQuestionDocRef: json['weakQuestionDocRef'] as String?,
    );

Map<String, dynamic> _$$_WeakQuestionToJson(_$_WeakQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryDocRef': instance.categoryDocRef,
      'quizDocRef': instance.quizDocRef,
      'questionDocRef': instance.questionDocRef,
      'weakQuestionDocRef': instance.weakQuestionDocRef,
    };
