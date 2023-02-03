// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizFormEntity {
  Field get id => throw _privateConstructorUsedError;
  Field get title => throw _privateConstructorUsedError;
  Field get description => throw _privateConstructorUsedError;
  Field get categoryId => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizFormEntityCopyWith<QuizFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizFormEntityCopyWith<$Res> {
  factory $QuizFormEntityCopyWith(
          QuizFormEntity value, $Res Function(QuizFormEntity) then) =
      _$QuizFormEntityCopyWithImpl<$Res, QuizFormEntity>;
  @useResult
  $Res call(
      {Field id,
      Field title,
      Field description,
      Field categoryId,
      String? imagePath});

  $FieldCopyWith<$Res> get id;
  $FieldCopyWith<$Res> get title;
  $FieldCopyWith<$Res> get description;
  $FieldCopyWith<$Res> get categoryId;
}

/// @nodoc
class _$QuizFormEntityCopyWithImpl<$Res, $Val extends QuizFormEntity>
    implements $QuizFormEntityCopyWith<$Res> {
  _$QuizFormEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? categoryId = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Field,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Field,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Field,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as Field,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get id {
    return $FieldCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get title {
    return $FieldCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get description {
    return $FieldCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get categoryId {
    return $FieldCopyWith<$Res>(_value.categoryId, (value) {
      return _then(_value.copyWith(categoryId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizFormEntityCopyWith<$Res>
    implements $QuizFormEntityCopyWith<$Res> {
  factory _$$_QuizFormEntityCopyWith(
          _$_QuizFormEntity value, $Res Function(_$_QuizFormEntity) then) =
      __$$_QuizFormEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Field id,
      Field title,
      Field description,
      Field categoryId,
      String? imagePath});

  @override
  $FieldCopyWith<$Res> get id;
  @override
  $FieldCopyWith<$Res> get title;
  @override
  $FieldCopyWith<$Res> get description;
  @override
  $FieldCopyWith<$Res> get categoryId;
}

/// @nodoc
class __$$_QuizFormEntityCopyWithImpl<$Res>
    extends _$QuizFormEntityCopyWithImpl<$Res, _$_QuizFormEntity>
    implements _$$_QuizFormEntityCopyWith<$Res> {
  __$$_QuizFormEntityCopyWithImpl(
      _$_QuizFormEntity _value, $Res Function(_$_QuizFormEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? categoryId = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$_QuizFormEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Field,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Field,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Field,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as Field,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_QuizFormEntity extends _QuizFormEntity {
  const _$_QuizFormEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.categoryId,
      this.imagePath})
      : super._();

  @override
  final Field id;
  @override
  final Field title;
  @override
  final Field description;
  @override
  final Field categoryId;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'QuizFormEntity(id: $id, title: $title, description: $description, categoryId: $categoryId, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizFormEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, categoryId, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizFormEntityCopyWith<_$_QuizFormEntity> get copyWith =>
      __$$_QuizFormEntityCopyWithImpl<_$_QuizFormEntity>(this, _$identity);
}

abstract class _QuizFormEntity extends QuizFormEntity {
  const factory _QuizFormEntity(
      {required final Field id,
      required final Field title,
      required final Field description,
      required final Field categoryId,
      final String? imagePath}) = _$_QuizFormEntity;
  const _QuizFormEntity._() : super._();

  @override
  Field get id;
  @override
  Field get title;
  @override
  Field get description;
  @override
  Field get categoryId;
  @override
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$_QuizFormEntityCopyWith<_$_QuizFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
