// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weak_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeakQuestion _$WeakQuestionFromJson(Map<String, dynamic> json) {
  return _WeakQuestion.fromJson(json);
}

/// @nodoc
mixin _$WeakQuestion {
  String? get id => throw _privateConstructorUsedError;
  String get categoryDocRef => throw _privateConstructorUsedError;
  String get quizDocRef => throw _privateConstructorUsedError;
  String get questionDocRef => throw _privateConstructorUsedError;
  String? get weakQuestionDocRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeakQuestionCopyWith<WeakQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeakQuestionCopyWith<$Res> {
  factory $WeakQuestionCopyWith(
          WeakQuestion value, $Res Function(WeakQuestion) then) =
      _$WeakQuestionCopyWithImpl<$Res, WeakQuestion>;
  @useResult
  $Res call(
      {String? id,
      String categoryDocRef,
      String quizDocRef,
      String questionDocRef,
      String? weakQuestionDocRef});
}

/// @nodoc
class _$WeakQuestionCopyWithImpl<$Res, $Val extends WeakQuestion>
    implements $WeakQuestionCopyWith<$Res> {
  _$WeakQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryDocRef = null,
    Object? quizDocRef = null,
    Object? questionDocRef = null,
    Object? weakQuestionDocRef = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryDocRef: null == categoryDocRef
          ? _value.categoryDocRef
          : categoryDocRef // ignore: cast_nullable_to_non_nullable
              as String,
      quizDocRef: null == quizDocRef
          ? _value.quizDocRef
          : quizDocRef // ignore: cast_nullable_to_non_nullable
              as String,
      questionDocRef: null == questionDocRef
          ? _value.questionDocRef
          : questionDocRef // ignore: cast_nullable_to_non_nullable
              as String,
      weakQuestionDocRef: freezed == weakQuestionDocRef
          ? _value.weakQuestionDocRef
          : weakQuestionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeakQuestionCopyWith<$Res>
    implements $WeakQuestionCopyWith<$Res> {
  factory _$$_WeakQuestionCopyWith(
          _$_WeakQuestion value, $Res Function(_$_WeakQuestion) then) =
      __$$_WeakQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String categoryDocRef,
      String quizDocRef,
      String questionDocRef,
      String? weakQuestionDocRef});
}

/// @nodoc
class __$$_WeakQuestionCopyWithImpl<$Res>
    extends _$WeakQuestionCopyWithImpl<$Res, _$_WeakQuestion>
    implements _$$_WeakQuestionCopyWith<$Res> {
  __$$_WeakQuestionCopyWithImpl(
      _$_WeakQuestion _value, $Res Function(_$_WeakQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryDocRef = null,
    Object? quizDocRef = null,
    Object? questionDocRef = null,
    Object? weakQuestionDocRef = freezed,
  }) {
    return _then(_$_WeakQuestion(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryDocRef: null == categoryDocRef
          ? _value.categoryDocRef
          : categoryDocRef // ignore: cast_nullable_to_non_nullable
              as String,
      quizDocRef: null == quizDocRef
          ? _value.quizDocRef
          : quizDocRef // ignore: cast_nullable_to_non_nullable
              as String,
      questionDocRef: null == questionDocRef
          ? _value.questionDocRef
          : questionDocRef // ignore: cast_nullable_to_non_nullable
              as String,
      weakQuestionDocRef: freezed == weakQuestionDocRef
          ? _value.weakQuestionDocRef
          : weakQuestionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeakQuestion extends _WeakQuestion {
  _$_WeakQuestion(
      {this.id,
      required this.categoryDocRef,
      required this.quizDocRef,
      required this.questionDocRef,
      this.weakQuestionDocRef})
      : super._();

  factory _$_WeakQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_WeakQuestionFromJson(json);

  @override
  final String? id;
  @override
  final String categoryDocRef;
  @override
  final String quizDocRef;
  @override
  final String questionDocRef;
  @override
  final String? weakQuestionDocRef;

  @override
  String toString() {
    return 'WeakQuestion(id: $id, categoryDocRef: $categoryDocRef, quizDocRef: $quizDocRef, questionDocRef: $questionDocRef, weakQuestionDocRef: $weakQuestionDocRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeakQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryDocRef, categoryDocRef) ||
                other.categoryDocRef == categoryDocRef) &&
            (identical(other.quizDocRef, quizDocRef) ||
                other.quizDocRef == quizDocRef) &&
            (identical(other.questionDocRef, questionDocRef) ||
                other.questionDocRef == questionDocRef) &&
            (identical(other.weakQuestionDocRef, weakQuestionDocRef) ||
                other.weakQuestionDocRef == weakQuestionDocRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryDocRef, quizDocRef,
      questionDocRef, weakQuestionDocRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeakQuestionCopyWith<_$_WeakQuestion> get copyWith =>
      __$$_WeakQuestionCopyWithImpl<_$_WeakQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeakQuestionToJson(
      this,
    );
  }
}

abstract class _WeakQuestion extends WeakQuestion {
  factory _WeakQuestion(
      {final String? id,
      required final String categoryDocRef,
      required final String quizDocRef,
      required final String questionDocRef,
      final String? weakQuestionDocRef}) = _$_WeakQuestion;
  _WeakQuestion._() : super._();

  factory _WeakQuestion.fromJson(Map<String, dynamic> json) =
      _$_WeakQuestion.fromJson;

  @override
  String? get id;
  @override
  String get categoryDocRef;
  @override
  String get quizDocRef;
  @override
  String get questionDocRef;
  @override
  String? get weakQuestionDocRef;
  @override
  @JsonKey(ignore: true)
  _$$_WeakQuestionCopyWith<_$_WeakQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
