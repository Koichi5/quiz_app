// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Option _$$_OptionFromJson(Map<String, dynamic> json) => _$_Option(
      id: json['id'] as String?,
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$$_OptionToJson(_$_Option instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'isCorrect': instance.isCorrect,
      'isSelected': instance.isSelected,
    };
