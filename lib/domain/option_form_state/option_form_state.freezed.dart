// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OptionFormState {
  OptionFormEntity get form => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OptionFormStateCopyWith<OptionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionFormStateCopyWith<$Res> {
  factory $OptionFormStateCopyWith(
          OptionFormState value, $Res Function(OptionFormState) then) =
      _$OptionFormStateCopyWithImpl<$Res, OptionFormState>;
  @useResult
  $Res call({OptionFormEntity form});

  $OptionFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class _$OptionFormStateCopyWithImpl<$Res, $Val extends OptionFormState>
    implements $OptionFormStateCopyWith<$Res> {
  _$OptionFormStateCopyWithImpl(this._value, this._then);

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
              as OptionFormEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionFormEntityCopyWith<$Res> get form {
    return $OptionFormEntityCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OptionFormStateCopyWith<$Res>
    implements $OptionFormStateCopyWith<$Res> {
  factory _$$_OptionFormStateCopyWith(
          _$_OptionFormState value, $Res Function(_$_OptionFormState) then) =
      __$$_OptionFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OptionFormEntity form});

  @override
  $OptionFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class __$$_OptionFormStateCopyWithImpl<$Res>
    extends _$OptionFormStateCopyWithImpl<$Res, _$_OptionFormState>
    implements _$$_OptionFormStateCopyWith<$Res> {
  __$$_OptionFormStateCopyWithImpl(
      _$_OptionFormState _value, $Res Function(_$_OptionFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_OptionFormState(
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as OptionFormEntity,
    ));
  }
}

/// @nodoc

class _$_OptionFormState implements _OptionFormState {
  const _$_OptionFormState(this.form);

  @override
  final OptionFormEntity form;

  @override
  String toString() {
    return 'OptionFormState(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionFormState &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionFormStateCopyWith<_$_OptionFormState> get copyWith =>
      __$$_OptionFormStateCopyWithImpl<_$_OptionFormState>(this, _$identity);
}

abstract class _OptionFormState implements OptionFormState {
  const factory _OptionFormState(final OptionFormEntity form) =
      _$_OptionFormState;

  @override
  OptionFormEntity get form;
  @override
  @JsonKey(ignore: true)
  _$$_OptionFormStateCopyWith<_$_OptionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
