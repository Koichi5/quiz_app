// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      optionsShuffled: json['optionsShuffled'] as bool,
      imagePath: json['imagePath'] as String,
      categoryId: json['categoryId'] as int,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'optionsShuffled': instance.optionsShuffled,
      'imagePath': instance.imagePath,
      'categoryId': instance.categoryId,
      'questions': instance.questions,
    };
