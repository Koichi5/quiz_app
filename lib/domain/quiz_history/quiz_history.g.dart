// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizHistory _$$_QuizHistoryFromJson(Map<String, dynamic> json) =>
    _$_QuizHistory(
      id: json['id'] as String?,
      categoryDocRef: json['categoryDocRef'] as String,
      quizDocRef: json['quizDocRef'] as String,
      quizTitle: json['quizTitle'] as String,
      score: json['score'] as String,
      timeTaken: json['timeTaken'] as String,
      quizDate: DateTime.parse(json['quizDate'] as String),
      status: json['status'] as String,
      takenQuestions: (json['takenQuestions'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      answerIsCorrectList: (json['answerIsCorrectList'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
    );

Map<String, dynamic> _$$_QuizHistoryToJson(_$_QuizHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryDocRef': instance.categoryDocRef,
      'quizDocRef': instance.quizDocRef,
      'quizTitle': instance.quizTitle,
      'score': instance.score,
      'timeTaken': instance.timeTaken,
      'quizDate': instance.quizDate.toIso8601String(),
      'status': instance.status,
      'takenQuestions': instance.takenQuestions,
      'answerIsCorrectList': instance.answerIsCorrectList,
    };
