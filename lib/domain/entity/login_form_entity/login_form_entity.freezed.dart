// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormEntity {
  Field get email => throw _privateConstructorUsedError;
  Field get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormEntityCopyWith<LoginFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormEntityCopyWith<$Res> {
  factory $LoginFormEntityCopyWith(
          LoginFormEntity value, $Res Function(LoginFormEntity) then) =
      _$LoginFormEntityCopyWithImpl<$Res, LoginFormEntity>;
  @useResult
  $Res call({Field email, Field password});

  $FieldCopyWith<$Res> get email;
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class _$LoginFormEntityCopyWithImpl<$Res, $Val extends LoginFormEntity>
    implements $LoginFormEntityCopyWith<$Res> {
  _$LoginFormEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get email {
    return $FieldCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get password {
    return $FieldCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginFormEntityCopyWith<$Res>
    implements $LoginFormEntityCopyWith<$Res> {
  factory _$$_LoginFormEntityCopyWith(
          _$_LoginFormEntity value, $Res Function(_$_LoginFormEntity) then) =
      __$$_LoginFormEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field email, Field password});

  @override
  $FieldCopyWith<$Res> get email;
  @override
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class __$$_LoginFormEntityCopyWithImpl<$Res>
    extends _$LoginFormEntityCopyWithImpl<$Res, _$_LoginFormEntity>
    implements _$$_LoginFormEntityCopyWith<$Res> {
  __$$_LoginFormEntityCopyWithImpl(
      _$_LoginFormEntity _value, $Res Function(_$_LoginFormEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginFormEntity(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field,
    ));
  }
}

/// @nodoc

class _$_LoginFormEntity extends _LoginFormEntity {
  const _$_LoginFormEntity({required this.email, required this.password})
      : super._();

  @override
  final Field email;
  @override
  final Field password;

  @override
  String toString() {
    return 'LoginFormEntity(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFormEntity &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFormEntityCopyWith<_$_LoginFormEntity> get copyWith =>
      __$$_LoginFormEntityCopyWithImpl<_$_LoginFormEntity>(this, _$identity);
}

abstract class _LoginFormEntity extends LoginFormEntity {
  const factory _LoginFormEntity(
      {required final Field email,
      required final Field password}) = _$_LoginFormEntity;
  const _LoginFormEntity._() : super._();

  @override
  Field get email;
  @override
  Field get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormEntityCopyWith<_$_LoginFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
