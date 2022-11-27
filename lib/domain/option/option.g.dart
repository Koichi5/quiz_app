// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Option _$$_OptionFromJson(Map<String, dynamic> json) => _$_Option(
      id: json['id'] as String?,
      categoryDocRef: json['categoryDocRef'] as String?,
      quizDocRef: json['quizDocRef'] as String?,
      questionDocRef: json['questionDocRef'] as String?,
      optionDocRef: json['optionDocRef'] as String?,
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$$_OptionToJson(_$_Option instance) => <String, dynamic>{
      'id': instance.id,
      'categoryDocRef': instance.categoryDocRef,
      'quizDocRef': instance.quizDocRef,
      'questionDocRef': instance.questionDocRef,
      'optionDocRef': instance.optionDocRef,
      'text': instance.text,
      'isCorrect': instance.isCorrect,
    };
