// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizHistory _$$_QuizHistoryFromJson(Map<String, dynamic> json) =>
    _$_QuizHistory(
      id: json['id'] as String?,
      quizId: json['quizId'] as int? ?? 0,
      categoryId: json['categoryId'] as int? ?? 0,
      quizTitle: json['quizTitle'] as String? ?? "",
      score: json['score'] as String? ?? "",
      timeTaken: json['timeTaken'] as String? ?? "",
      quizDate: DateTime.parse(json['quizDate'] as String),
      status: json['status'] as String? ?? "",
    );

Map<String, dynamic> _$$_QuizHistoryToJson(_$_QuizHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quizId': instance.quizId,
      'categoryId': instance.categoryId,
      'quizTitle': instance.quizTitle,
      'score': instance.score,
      'timeTaken': instance.timeTaken,
      'quizDate': instance.quizDate.toIso8601String(),
      'status': instance.status,
    };
