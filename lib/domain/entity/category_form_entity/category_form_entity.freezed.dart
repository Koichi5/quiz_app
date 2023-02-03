// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryFormEntity {
  Field get id => throw _privateConstructorUsedError;
  Field get name => throw _privateConstructorUsedError;
  Field get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryFormEntityCopyWith<CategoryFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFormEntityCopyWith<$Res> {
  factory $CategoryFormEntityCopyWith(
          CategoryFormEntity value, $Res Function(CategoryFormEntity) then) =
      _$CategoryFormEntityCopyWithImpl<$Res, CategoryFormEntity>;
  @useResult
  $Res call({Field id, Field name, Field description, String? imagePath});

  $FieldCopyWith<$Res> get id;
  $FieldCopyWith<$Res> get name;
  $FieldCopyWith<$Res> get description;
}

/// @nodoc
class _$CategoryFormEntityCopyWithImpl<$Res, $Val extends CategoryFormEntity>
    implements $CategoryFormEntityCopyWith<$Res> {
  _$CategoryFormEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Field,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
  $FieldCopyWith<$Res> get name {
    return $FieldCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get description {
    return $FieldCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CategoryFormEntityCopyWith<$Res>
    implements $CategoryFormEntityCopyWith<$Res> {
  factory _$$_CategoryFormEntityCopyWith(_$_CategoryFormEntity value,
          $Res Function(_$_CategoryFormEntity) then) =
      __$$_CategoryFormEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field id, Field name, Field description, String? imagePath});

  @override
  $FieldCopyWith<$Res> get id;
  @override
  $FieldCopyWith<$Res> get name;
  @override
  $FieldCopyWith<$Res> get description;
}

/// @nodoc
class __$$_CategoryFormEntityCopyWithImpl<$Res>
    extends _$CategoryFormEntityCopyWithImpl<$Res, _$_CategoryFormEntity>
    implements _$$_CategoryFormEntityCopyWith<$Res> {
  __$$_CategoryFormEntityCopyWithImpl(
      _$_CategoryFormEntity _value, $Res Function(_$_CategoryFormEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$_CategoryFormEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Field,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Field,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CategoryFormEntity extends _CategoryFormEntity {
  const _$_CategoryFormEntity(
      {required this.id,
      required this.name,
      required this.description,
      this.imagePath})
      : super._();

  @override
  final Field id;
  @override
  final Field name;
  @override
  final Field description;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'CategoryFormEntity(id: $id, name: $name, description: $description, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryFormEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryFormEntityCopyWith<_$_CategoryFormEntity> get copyWith =>
      __$$_CategoryFormEntityCopyWithImpl<_$_CategoryFormEntity>(
          this, _$identity);
}

abstract class _CategoryFormEntity extends CategoryFormEntity {
  const factory _CategoryFormEntity(
      {required final Field id,
      required final Field name,
      required final Field description,
      final String? imagePath}) = _$_CategoryFormEntity;
  const _CategoryFormEntity._() : super._();

  @override
  Field get id;
  @override
  Field get name;
  @override
  Field get description;
  @override
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryFormEntityCopyWith<_$_CategoryFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
