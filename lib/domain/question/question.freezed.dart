// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String? get id => throw _privateConstructorUsedError;
  String? get categoryDocRef => throw _privateConstructorUsedError;
  String? get quizDocRef => throw _privateConstructorUsedError;
  String? get questionDocRef => throw _privateConstructorUsedError;
  String? get originalQuestionDocRef => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  bool get optionsShuffled => throw _privateConstructorUsedError;
  List<Option> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String? id,
      String? categoryDocRef,
      String? quizDocRef,
      String? questionDocRef,
      String? originalQuestionDocRef,
      String text,
      int duration,
      bool optionsShuffled,
      List<Option> options});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryDocRef = freezed,
    Object? quizDocRef = freezed,
    Object? questionDocRef = freezed,
    Object? originalQuestionDocRef = freezed,
    Object? text = null,
    Object? duration = null,
    Object? optionsShuffled = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryDocRef: freezed == categoryDocRef
          ? _value.categoryDocRef
          : categoryDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      quizDocRef: freezed == quizDocRef
          ? _value.quizDocRef
          : quizDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      questionDocRef: freezed == questionDocRef
          ? _value.questionDocRef
          : questionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      originalQuestionDocRef: freezed == originalQuestionDocRef
          ? _value.originalQuestionDocRef
          : originalQuestionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      optionsShuffled: null == optionsShuffled
          ? _value.optionsShuffled
          : optionsShuffled // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? categoryDocRef,
      String? quizDocRef,
      String? questionDocRef,
      String? originalQuestionDocRef,
      String text,
      int duration,
      bool optionsShuffled,
      List<Option> options});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryDocRef = freezed,
    Object? quizDocRef = freezed,
    Object? questionDocRef = freezed,
    Object? originalQuestionDocRef = freezed,
    Object? text = null,
    Object? duration = null,
    Object? optionsShuffled = null,
    Object? options = null,
  }) {
    return _then(_$_Question(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryDocRef: freezed == categoryDocRef
          ? _value.categoryDocRef
          : categoryDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      quizDocRef: freezed == quizDocRef
          ? _value.quizDocRef
          : quizDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      questionDocRef: freezed == questionDocRef
          ? _value.questionDocRef
          : questionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      originalQuestionDocRef: freezed == originalQuestionDocRef
          ? _value.originalQuestionDocRef
          : originalQuestionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      optionsShuffled: null == optionsShuffled
          ? _value.optionsShuffled
          : optionsShuffled // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question extends _Question {
  const _$_Question(
      {this.id,
      this.categoryDocRef,
      this.quizDocRef,
      this.questionDocRef,
      this.originalQuestionDocRef,
      required this.text,
      required this.duration,
      required this.optionsShuffled,
      required final List<Option> options})
      : _options = options,
        super._();

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final String? id;
  @override
  final String? categoryDocRef;
  @override
  final String? quizDocRef;
  @override
  final String? questionDocRef;
  @override
  final String? originalQuestionDocRef;
  @override
  final String text;
  @override
  final int duration;
  @override
  final bool optionsShuffled;
  final List<Option> _options;
  @override
  List<Option> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'Question(id: $id, categoryDocRef: $categoryDocRef, quizDocRef: $quizDocRef, questionDocRef: $questionDocRef, originalQuestionDocRef: $originalQuestionDocRef, text: $text, duration: $duration, optionsShuffled: $optionsShuffled, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryDocRef, categoryDocRef) ||
                other.categoryDocRef == categoryDocRef) &&
            (identical(other.quizDocRef, quizDocRef) ||
                other.quizDocRef == quizDocRef) &&
            (identical(other.questionDocRef, questionDocRef) ||
                other.questionDocRef == questionDocRef) &&
            (identical(other.originalQuestionDocRef, originalQuestionDocRef) ||
                other.originalQuestionDocRef == originalQuestionDocRef) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.optionsShuffled, optionsShuffled) ||
                other.optionsShuffled == optionsShuffled) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryDocRef,
      quizDocRef,
      questionDocRef,
      originalQuestionDocRef,
      text,
      duration,
      optionsShuffled,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question extends Question {
  const factory _Question(
      {final String? id,
      final String? categoryDocRef,
      final String? quizDocRef,
      final String? questionDocRef,
      final String? originalQuestionDocRef,
      required final String text,
      required final int duration,
      required final bool optionsShuffled,
      required final List<Option> options}) = _$_Question;
  const _Question._() : super._();

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String? get id;
  @override
  String? get categoryDocRef;
  @override
  String? get quizDocRef;
  @override
  String? get questionDocRef;
  @override
  String? get originalQuestionDocRef;
  @override
  String get text;
  @override
  int get duration;
  @override
  bool get optionsShuffled;
  @override
  List<Option> get options;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
