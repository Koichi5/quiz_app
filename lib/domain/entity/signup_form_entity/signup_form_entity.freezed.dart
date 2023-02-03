// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupFormEntity {
  Field get name => throw _privateConstructorUsedError;
  Field get email => throw _privateConstructorUsedError;
  Field get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupFormEntityCopyWith<SignupFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFormEntityCopyWith<$Res> {
  factory $SignupFormEntityCopyWith(
          SignupFormEntity value, $Res Function(SignupFormEntity) then) =
      _$SignupFormEntityCopyWithImpl<$Res, SignupFormEntity>;
  @useResult
  $Res call({Field name, Field email, Field password});

  $FieldCopyWith<$Res> get name;
  $FieldCopyWith<$Res> get email;
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class _$SignupFormEntityCopyWithImpl<$Res, $Val extends SignupFormEntity>
    implements $SignupFormEntityCopyWith<$Res> {
  _$SignupFormEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field,
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
  $FieldCopyWith<$Res> get name {
    return $FieldCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
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
abstract class _$$_SignupFormEntityCopyWith<$Res>
    implements $SignupFormEntityCopyWith<$Res> {
  factory _$$_SignupFormEntityCopyWith(
          _$_SignupFormEntity value, $Res Function(_$_SignupFormEntity) then) =
      __$$_SignupFormEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field name, Field email, Field password});

  @override
  $FieldCopyWith<$Res> get name;
  @override
  $FieldCopyWith<$Res> get email;
  @override
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class __$$_SignupFormEntityCopyWithImpl<$Res>
    extends _$SignupFormEntityCopyWithImpl<$Res, _$_SignupFormEntity>
    implements _$$_SignupFormEntityCopyWith<$Res> {
  __$$_SignupFormEntityCopyWithImpl(
      _$_SignupFormEntity _value, $Res Function(_$_SignupFormEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignupFormEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field,
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

class _$_SignupFormEntity extends _SignupFormEntity {
  const _$_SignupFormEntity(
      {required this.name, required this.email, required this.password})
      : super._();

  @override
  final Field name;
  @override
  final Field email;
  @override
  final Field password;

  @override
  String toString() {
    return 'SignupFormEntity(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupFormEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupFormEntityCopyWith<_$_SignupFormEntity> get copyWith =>
      __$$_SignupFormEntityCopyWithImpl<_$_SignupFormEntity>(this, _$identity);
}

abstract class _SignupFormEntity extends SignupFormEntity {
  const factory _SignupFormEntity(
      {required final Field name,
      required final Field email,
      required final Field password}) = _$_SignupFormEntity;
  const _SignupFormEntity._() : super._();

  @override
  Field get name;
  @override
  Field get email;
  @override
  Field get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignupFormEntityCopyWith<_$_SignupFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
