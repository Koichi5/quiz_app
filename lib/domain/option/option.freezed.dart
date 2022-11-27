// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  String? get id => throw _privateConstructorUsedError;
  String? get categoryDocRef => throw _privateConstructorUsedError;
  String? get quizDocRef => throw _privateConstructorUsedError;
  String? get questionDocRef => throw _privateConstructorUsedError;
  String? get optionDocRef => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call(
      {String? id,
      String? categoryDocRef,
      String? quizDocRef,
      String? questionDocRef,
      String? optionDocRef,
      String text,
      bool isCorrect});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

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
    Object? optionDocRef = freezed,
    Object? text = null,
    Object? isCorrect = null,
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
      optionDocRef: freezed == optionDocRef
          ? _value.optionDocRef
          : optionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$_OptionCopyWith(_$_Option value, $Res Function(_$_Option) then) =
      __$$_OptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? categoryDocRef,
      String? quizDocRef,
      String? questionDocRef,
      String? optionDocRef,
      String text,
      bool isCorrect});
}

/// @nodoc
class __$$_OptionCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$_Option>
    implements _$$_OptionCopyWith<$Res> {
  __$$_OptionCopyWithImpl(_$_Option _value, $Res Function(_$_Option) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryDocRef = freezed,
    Object? quizDocRef = freezed,
    Object? questionDocRef = freezed,
    Object? optionDocRef = freezed,
    Object? text = null,
    Object? isCorrect = null,
  }) {
    return _then(_$_Option(
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
      optionDocRef: freezed == optionDocRef
          ? _value.optionDocRef
          : optionDocRef // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Option extends _Option {
  const _$_Option(
      {this.id,
      this.categoryDocRef,
      this.quizDocRef,
      this.questionDocRef,
      this.optionDocRef,
      required this.text,
      required this.isCorrect})
      : super._();

  factory _$_Option.fromJson(Map<String, dynamic> json) =>
      _$$_OptionFromJson(json);

  @override
  final String? id;
  @override
  final String? categoryDocRef;
  @override
  final String? quizDocRef;
  @override
  final String? questionDocRef;
  @override
  final String? optionDocRef;
  @override
  final String text;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'Option(id: $id, categoryDocRef: $categoryDocRef, quizDocRef: $quizDocRef, questionDocRef: $questionDocRef, optionDocRef: $optionDocRef, text: $text, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Option &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryDocRef, categoryDocRef) ||
                other.categoryDocRef == categoryDocRef) &&
            (identical(other.quizDocRef, quizDocRef) ||
                other.quizDocRef == quizDocRef) &&
            (identical(other.questionDocRef, questionDocRef) ||
                other.questionDocRef == questionDocRef) &&
            (identical(other.optionDocRef, optionDocRef) ||
                other.optionDocRef == optionDocRef) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryDocRef, quizDocRef,
      questionDocRef, optionDocRef, text, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionCopyWith<_$_Option> get copyWith =>
      __$$_OptionCopyWithImpl<_$_Option>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionToJson(
      this,
    );
  }
}

abstract class _Option extends Option {
  const factory _Option(
      {final String? id,
      final String? categoryDocRef,
      final String? quizDocRef,
      final String? questionDocRef,
      final String? optionDocRef,
      required final String text,
      required final bool isCorrect}) = _$_Option;
  const _Option._() : super._();

  factory _Option.fromJson(Map<String, dynamic> json) = _$_Option.fromJson;

  @override
  String? get id;
  @override
  String? get categoryDocRef;
  @override
  String? get quizDocRef;
  @override
  String? get questionDocRef;
  @override
  String? get optionDocRef;
  @override
  String get text;
  @override
  bool get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$_OptionCopyWith<_$_Option> get copyWith =>
      throw _privateConstructorUsedError;
}
