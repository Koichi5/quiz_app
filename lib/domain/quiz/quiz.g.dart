// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as int,
      categoryDocRef: json['categoryDocRef'] as String?,
      quizDocRef: json['quizDocRef'] as String?,
      questionDocRef: json['questionDocRef'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      questionsShuffled: json['questionsShuffled'] as bool,
      imagePath: json['imagePath'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'categoryDocRef': instance.categoryDocRef,
      'quizDocRef': instance.quizDocRef,
      'questionDocRef': instance.questionDocRef,
      'title': instance.title,
      'description': instance.description,
      'questionsShuffled': instance.questionsShuffled,
      'imagePath': instance.imagePath,
      'questions': instance.questions,
    };
