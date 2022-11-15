// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as String,
      text: json['text'] as String,
      duration: json['duration'] as int,
      optionsShuffled: json['optionsShuffled'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'duration': instance.duration,
      'optionsShuffled': instance.optionsShuffled,
      'options': instance.options,
    };
