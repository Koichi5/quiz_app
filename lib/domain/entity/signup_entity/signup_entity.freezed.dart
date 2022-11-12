// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupEntity {
  Field get name => throw _privateConstructorUsedError;
  Field get email => throw _privateConstructorUsedError;
  Field get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupEntityCopyWith<SignupEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupEntityCopyWith<$Res> {
  factory $SignupEntityCopyWith(
          SignupEntity value, $Res Function(SignupEntity) then) =
      _$SignupEntityCopyWithImpl<$Res, SignupEntity>;
  @useResult
  $Res call({Field name, Field email, Field password});

  $FieldCopyWith<$Res> get name;
  $FieldCopyWith<$Res> get email;
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class _$SignupEntityCopyWithImpl<$Res, $Val extends SignupEntity>
    implements $SignupEntityCopyWith<$Res> {
  _$SignupEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_SignupEntityCopyWith<$Res>
    implements $SignupEntityCopyWith<$Res> {
  factory _$$_SignupEntityCopyWith(
          _$_SignupEntity value, $Res Function(_$_SignupEntity) then) =
      __$$_SignupEntityCopyWithImpl<$Res>;
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
class __$$_SignupEntityCopyWithImpl<$Res>
    extends _$SignupEntityCopyWithImpl<$Res, _$_SignupEntity>
    implements _$$_SignupEntityCopyWith<$Res> {
  __$$_SignupEntityCopyWithImpl(
      _$_SignupEntity _value, $Res Function(_$_SignupEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignupEntity(
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

class _$_SignupEntity extends _SignupEntity {
  const _$_SignupEntity(
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
    return 'SignupEntity(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupEntity &&
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
  _$$_SignupEntityCopyWith<_$_SignupEntity> get copyWith =>
      __$$_SignupEntityCopyWithImpl<_$_SignupEntity>(this, _$identity);
}

abstract class _SignupEntity extends SignupEntity {
  const factory _SignupEntity(
      {required final Field name,
      required final Field email,
      required final Field password}) = _$_SignupEntity;
  const _SignupEntity._() : super._();

  @override
  Field get name;
  @override
  Field get email;
  @override
  Field get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignupEntityCopyWith<_$_SignupEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
