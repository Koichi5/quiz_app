// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  String? get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String? get categoryDocRef => throw _privateConstructorUsedError;
  String? get quizDocRef => throw _privateConstructorUsedError;
  String? get questionDocRef => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get questionsShuffled => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  List<Question>? get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {String? id,
      int categoryId,
      String? categoryDocRef,
      String? quizDocRef,
      String? questionDocRef,
      String title,
      String description,
      bool questionsShuffled,
      String? imagePath,
      List<Question>? questions});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? categoryDocRef = freezed,
    Object? quizDocRef = freezed,
    Object? questionDocRef = freezed,
    Object? title = null,
    Object? description = null,
    Object? questionsShuffled = null,
    Object? imagePath = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      questionsShuffled: null == questionsShuffled
          ? _value.questionsShuffled
          : questionsShuffled // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$_QuizCopyWith(_$_Quiz value, $Res Function(_$_Quiz) then) =
      __$$_QuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int categoryId,
      String? categoryDocRef,
      String? quizDocRef,
      String? questionDocRef,
      String title,
      String description,
      bool questionsShuffled,
      String? imagePath,
      List<Question>? questions});
}

/// @nodoc
class __$$_QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res, _$_Quiz>
    implements _$$_QuizCopyWith<$Res> {
  __$$_QuizCopyWithImpl(_$_Quiz _value, $Res Function(_$_Quiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? categoryDocRef = freezed,
    Object? quizDocRef = freezed,
    Object? questionDocRef = freezed,
    Object? title = null,
    Object? description = null,
    Object? questionsShuffled = null,
    Object? imagePath = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$_Quiz(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      questionsShuffled: null == questionsShuffled
          ? _value.questionsShuffled
          : questionsShuffled // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz extends _Quiz {
  const _$_Quiz(
      {this.id,
      required this.categoryId,
      this.categoryDocRef,
      this.quizDocRef,
      this.questionDocRef,
      required this.title,
      required this.description,
      required this.questionsShuffled,
      this.imagePath,
      final List<Question>? questions})
      : _questions = questions,
        super._();

  factory _$_Quiz.fromJson(Map<String, dynamic> json) => _$$_QuizFromJson(json);

  @override
  final String? id;
  @override
  final int categoryId;
  @override
  final String? categoryDocRef;
  @override
  final String? quizDocRef;
  @override
  final String? questionDocRef;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool questionsShuffled;
  @override
  final String? imagePath;
  final List<Question>? _questions;
  @override
  List<Question>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Quiz(id: $id, categoryId: $categoryId, categoryDocRef: $categoryDocRef, quizDocRef: $quizDocRef, questionDocRef: $questionDocRef, title: $title, description: $description, questionsShuffled: $questionsShuffled, imagePath: $imagePath, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quiz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryDocRef, categoryDocRef) ||
                other.categoryDocRef == categoryDocRef) &&
            (identical(other.quizDocRef, quizDocRef) ||
                other.quizDocRef == quizDocRef) &&
            (identical(other.questionDocRef, questionDocRef) ||
                other.questionDocRef == questionDocRef) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.questionsShuffled, questionsShuffled) ||
                other.questionsShuffled == questionsShuffled) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      categoryDocRef,
      quizDocRef,
      questionDocRef,
      title,
      description,
      questionsShuffled,
      imagePath,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizCopyWith<_$_Quiz> get copyWith =>
      __$$_QuizCopyWithImpl<_$_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizToJson(
      this,
    );
  }
}

abstract class _Quiz extends Quiz {
  const factory _Quiz(
      {final String? id,
      required final int categoryId,
      final String? categoryDocRef,
      final String? quizDocRef,
      final String? questionDocRef,
      required final String title,
      required final String description,
      required final bool questionsShuffled,
      final String? imagePath,
      final List<Question>? questions}) = _$_Quiz;
  const _Quiz._() : super._();

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  String? get id;
  @override
  int get categoryId;
  @override
  String? get categoryDocRef;
  @override
  String? get quizDocRef;
  @override
  String? get questionDocRef;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get questionsShuffled;
  @override
  String? get imagePath;
  @override
  List<Question>? get questions;
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}
