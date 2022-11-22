// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as int,
      categoryDocRef: json['categoryDocRef'] as String?,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'categoryDocRef': instance.categoryDocRef,
      'name': instance.name,
      'imagePath': instance.imagePath,
    };
