// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OptionFormEntity {
  Field get id => throw _privateConstructorUsedError;
  Field get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OptionFormEntityCopyWith<OptionFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionFormEntityCopyWith<$Res> {
  factory $OptionFormEntityCopyWith(
          OptionFormEntity value, $Res Function(OptionFormEntity) then) =
      _$OptionFormEntityCopyWithImpl<$Res, OptionFormEntity>;
  @useResult
  $Res call({Field id, Field text});

  $FieldCopyWith<$Res> get id;
  $FieldCopyWith<$Res> get text;
}

/// @nodoc
class _$OptionFormEntityCopyWithImpl<$Res, $Val extends OptionFormEntity>
    implements $OptionFormEntityCopyWith<$Res> {
  _$OptionFormEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Field,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Field,
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
  $FieldCopyWith<$Res> get text {
    return $FieldCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OptionFormEntityCopyWith<$Res>
    implements $OptionFormEntityCopyWith<$Res> {
  factory _$$_OptionFormEntityCopyWith(
          _$_OptionFormEntity value, $Res Function(_$_OptionFormEntity) then) =
      __$$_OptionFormEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field id, Field text});

  @override
  $FieldCopyWith<$Res> get id;
  @override
  $FieldCopyWith<$Res> get text;
}

/// @nodoc
class __$$_OptionFormEntityCopyWithImpl<$Res>
    extends _$OptionFormEntityCopyWithImpl<$Res, _$_OptionFormEntity>
    implements _$$_OptionFormEntityCopyWith<$Res> {
  __$$_OptionFormEntityCopyWithImpl(
      _$_OptionFormEntity _value, $Res Function(_$_OptionFormEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$_OptionFormEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Field,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Field,
    ));
  }
}

/// @nodoc

class _$_OptionFormEntity extends _OptionFormEntity {
  const _$_OptionFormEntity({required this.id, required this.text}) : super._();

  @override
  final Field id;
  @override
  final Field text;

  @override
  String toString() {
    return 'OptionFormEntity(id: $id, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionFormEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionFormEntityCopyWith<_$_OptionFormEntity> get copyWith =>
      __$$_OptionFormEntityCopyWithImpl<_$_OptionFormEntity>(this, _$identity);
}

abstract class _OptionFormEntity extends OptionFormEntity {
  const factory _OptionFormEntity(
      {required final Field id,
      required final Field text}) = _$_OptionFormEntity;
  const _OptionFormEntity._() : super._();

  @override
  Field get id;
  @override
  Field get text;
  @override
  @JsonKey(ignore: true)
  _$$_OptionFormEntityCopyWith<_$_OptionFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
