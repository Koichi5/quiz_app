// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizFormState {
  QuizFormEntity get form => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizFormStateCopyWith<QuizFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizFormStateCopyWith<$Res> {
  factory $QuizFormStateCopyWith(
          QuizFormState value, $Res Function(QuizFormState) then) =
      _$QuizFormStateCopyWithImpl<$Res, QuizFormState>;
  @useResult
  $Res call({QuizFormEntity form});

  $QuizFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class _$QuizFormStateCopyWithImpl<$Res, $Val extends QuizFormState>
    implements $QuizFormStateCopyWith<$Res> {
  _$QuizFormStateCopyWithImpl(this._value, this._then);

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
              as QuizFormEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizFormEntityCopyWith<$Res> get form {
    return $QuizFormEntityCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizFormStateCopyWith<$Res>
    implements $QuizFormStateCopyWith<$Res> {
  factory _$$_QuizFormStateCopyWith(
          _$_QuizFormState value, $Res Function(_$_QuizFormState) then) =
      __$$_QuizFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuizFormEntity form});

  @override
  $QuizFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class __$$_QuizFormStateCopyWithImpl<$Res>
    extends _$QuizFormStateCopyWithImpl<$Res, _$_QuizFormState>
    implements _$$_QuizFormStateCopyWith<$Res> {
  __$$_QuizFormStateCopyWithImpl(
      _$_QuizFormState _value, $Res Function(_$_QuizFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_QuizFormState(
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as QuizFormEntity,
    ));
  }
}

/// @nodoc

class _$_QuizFormState implements _QuizFormState {
  const _$_QuizFormState(this.form);

  @override
  final QuizFormEntity form;

  @override
  String toString() {
    return 'QuizFormState(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizFormState &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizFormStateCopyWith<_$_QuizFormState> get copyWith =>
      __$$_QuizFormStateCopyWithImpl<_$_QuizFormState>(this, _$identity);
}

abstract class _QuizFormState implements QuizFormState {
  const factory _QuizFormState(final QuizFormEntity form) = _$_QuizFormState;

  @override
  QuizFormEntity get form;
  @override
  @JsonKey(ignore: true)
  _$$_QuizFormStateCopyWith<_$_QuizFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
