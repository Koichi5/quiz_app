// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionFormState {
  QuestionFormEntity get form => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionFormStateCopyWith<QuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionFormStateCopyWith<$Res> {
  factory $QuestionFormStateCopyWith(
          QuestionFormState value, $Res Function(QuestionFormState) then) =
      _$QuestionFormStateCopyWithImpl<$Res, QuestionFormState>;
  @useResult
  $Res call({QuestionFormEntity form});

  $QuestionFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class _$QuestionFormStateCopyWithImpl<$Res, $Val extends QuestionFormState>
    implements $QuestionFormStateCopyWith<$Res> {
  _$QuestionFormStateCopyWithImpl(this._value, this._then);

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
              as QuestionFormEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionFormEntityCopyWith<$Res> get form {
    return $QuestionFormEntityCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuestionFormStateCopyWith<$Res>
    implements $QuestionFormStateCopyWith<$Res> {
  factory _$$_QuestionFormStateCopyWith(_$_QuestionFormState value,
          $Res Function(_$_QuestionFormState) then) =
      __$$_QuestionFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuestionFormEntity form});

  @override
  $QuestionFormEntityCopyWith<$Res> get form;
}

/// @nodoc
class __$$_QuestionFormStateCopyWithImpl<$Res>
    extends _$QuestionFormStateCopyWithImpl<$Res, _$_QuestionFormState>
    implements _$$_QuestionFormStateCopyWith<$Res> {
  __$$_QuestionFormStateCopyWithImpl(
      _$_QuestionFormState _value, $Res Function(_$_QuestionFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_QuestionFormState(
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as QuestionFormEntity,
    ));
  }
}

/// @nodoc

class _$_QuestionFormState implements _QuestionFormState {
  const _$_QuestionFormState(this.form);

  @override
  final QuestionFormEntity form;

  @override
  String toString() {
    return 'QuestionFormState(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionFormState &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionFormStateCopyWith<_$_QuestionFormState> get copyWith =>
      __$$_QuestionFormStateCopyWithImpl<_$_QuestionFormState>(
          this, _$identity);
}

abstract class _QuestionFormState implements QuestionFormState {
  const factory _QuestionFormState(final QuestionFormEntity form) =
      _$_QuestionFormState;

  @override
  QuestionFormEntity get form;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionFormStateCopyWith<_$_QuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
