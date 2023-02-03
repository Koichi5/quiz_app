// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupFormState {
  SignupFormEntity get form => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupFormStateCopyWith<SignupFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFormStateCopyWith<$Res> {
  factory $SignupFormStateCopyWith(
          SignupFormState value, $Res Function(SignupFormState) then) =
      _$SignupFormStateCopyWithImpl<$Res, SignupFormState>;
  @useResult
  $Res call({SignupFormEntity form});

  $SignupFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class _$SignupFormStateCopyWithImpl<$Res, $Val extends SignupFormState>
    implements $SignupFormStateCopyWith<$Res> {
  _$SignupFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as SignupFormEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignupFormEntityCopyWith<$Res> get form {
    return $SignupFormEntityCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SignupFormStateCopyWith<$Res>
    implements $SignupFormStateCopyWith<$Res> {
  factory _$$_SignupFormStateCopyWith(
          _$_SignupFormState value, $Res Function(_$_SignupFormState) then) =
      __$$_SignupFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignupFormEntity form});

  @override
  $SignupFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class __$$_SignupFormStateCopyWithImpl<$Res>
    extends _$SignupFormStateCopyWithImpl<$Res, _$_SignupFormState>
    implements _$$_SignupFormStateCopyWith<$Res> {
  __$$_SignupFormStateCopyWithImpl(
      _$_SignupFormState _value, $Res Function(_$_SignupFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_SignupFormState(
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as SignupFormEntity,
    ));
  }
}

/// @nodoc

class _$_SignupFormState implements _SignupFormState {
  const _$_SignupFormState(this.form);

  @override
  final SignupFormEntity form;

  @override
  String toString() {
    return 'SignupFormState(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupFormState &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupFormStateCopyWith<_$_SignupFormState> get copyWith =>
      __$$_SignupFormStateCopyWithImpl<_$_SignupFormState>(this, _$identity);
}

abstract class _SignupFormState implements SignupFormState {
  const factory _SignupFormState(final SignupFormEntity form) =
      _$_SignupFormState;

  @override
  SignupFormEntity get form;
  @override
  @JsonKey(ignore: true)
  _$$_SignupFormStateCopyWith<_$_SignupFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
