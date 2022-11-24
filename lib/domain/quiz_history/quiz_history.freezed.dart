// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizHistory _$QuizHistoryFromJson(Map<String, dynamic> json) {
  return _QuizHistory.fromJson(json);
}

/// @nodoc
mixin _$QuizHistory {
  String? get id => throw _privateConstructorUsedError;
  int get quizId => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get quizTitle => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError;
  String get timeTaken => throw _privateConstructorUsedError;
  DateTime get quizDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizHistoryCopyWith<QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizHistoryCopyWith<$Res> {
  factory $QuizHistoryCopyWith(
          QuizHistory value, $Res Function(QuizHistory) then) =
      _$QuizHistoryCopyWithImpl<$Res, QuizHistory>;
  @useResult
  $Res call(
      {String? id,
      int quizId,
      int categoryId,
      String quizTitle,
      String score,
      String timeTaken,
      DateTime quizDate,
      String status});
}

/// @nodoc
class _$QuizHistoryCopyWithImpl<$Res, $Val extends QuizHistory>
    implements $QuizHistoryCopyWith<$Res> {
  _$QuizHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quizId = null,
    Object? categoryId = null,
    Object? quizTitle = null,
    Object? score = null,
    Object? timeTaken = null,
    Object? quizDate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      quizTitle: null == quizTitle
          ? _value.quizTitle
          : quizTitle // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as String,
      quizDate: null == quizDate
          ? _value.quizDate
          : quizDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizHistoryCopyWith<$Res>
    implements $QuizHistoryCopyWith<$Res> {
  factory _$$_QuizHistoryCopyWith(
          _$_QuizHistory value, $Res Function(_$_QuizHistory) then) =
      __$$_QuizHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int quizId,
      int categoryId,
      String quizTitle,
      String score,
      String timeTaken,
      DateTime quizDate,
      String status});
}

/// @nodoc
class __$$_QuizHistoryCopyWithImpl<$Res>
    extends _$QuizHistoryCopyWithImpl<$Res, _$_QuizHistory>
    implements _$$_QuizHistoryCopyWith<$Res> {
  __$$_QuizHistoryCopyWithImpl(
      _$_QuizHistory _value, $Res Function(_$_QuizHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quizId = null,
    Object? categoryId = null,
    Object? quizTitle = null,
    Object? score = null,
    Object? timeTaken = null,
    Object? quizDate = null,
    Object? status = null,
  }) {
    return _then(_$_QuizHistory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      quizTitle: null == quizTitle
          ? _value.quizTitle
          : quizTitle // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as String,
      quizDate: null == quizDate
          ? _value.quizDate
          : quizDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizHistory extends _QuizHistory {
  _$_QuizHistory(
      {this.id,
      this.quizId = 0,
      this.categoryId = 0,
      this.quizTitle = "",
      this.score = "",
      this.timeTaken = "",
      required this.quizDate,
      this.status = ""})
      : super._();

  factory _$_QuizHistory.fromJson(Map<String, dynamic> json) =>
      _$$_QuizHistoryFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final int quizId;
  @override
  @JsonKey()
  final int categoryId;
  @override
  @JsonKey()
  final String quizTitle;
  @override
  @JsonKey()
  final String score;
  @override
  @JsonKey()
  final String timeTaken;
  @override
  final DateTime quizDate;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'QuizHistory(id: $id, quizId: $quizId, categoryId: $categoryId, quizTitle: $quizTitle, score: $score, timeTaken: $timeTaken, quizDate: $quizDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.quizTitle, quizTitle) ||
                other.quizTitle == quizTitle) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.timeTaken, timeTaken) ||
                other.timeTaken == timeTaken) &&
            (identical(other.quizDate, quizDate) ||
                other.quizDate == quizDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quizId, categoryId,
      quizTitle, score, timeTaken, quizDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizHistoryCopyWith<_$_QuizHistory> get copyWith =>
      __$$_QuizHistoryCopyWithImpl<_$_QuizHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizHistoryToJson(
      this,
    );
  }
}

abstract class _QuizHistory extends QuizHistory {
  factory _QuizHistory(
      {final String? id,
      final int quizId,
      final int categoryId,
      final String quizTitle,
      final String score,
      final String timeTaken,
      required final DateTime quizDate,
      final String status}) = _$_QuizHistory;
  _QuizHistory._() : super._();

  factory _QuizHistory.fromJson(Map<String, dynamic> json) =
      _$_QuizHistory.fromJson;

  @override
  String? get id;
  @override
  int get quizId;
  @override
  int get categoryId;
  @override
  String get quizTitle;
  @override
  String get score;
  @override
  String get timeTaken;
  @override
  DateTime get quizDate;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_QuizHistoryCopyWith<_$_QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
