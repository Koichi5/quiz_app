// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weak_question_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeakQuestionList _$WeakQuestionListFromJson(Map<String, dynamic> json) {
  return _WeakQuestionList.fromJson(json);
}

/// @nodoc
mixin _$WeakQuestionList {
  String? get id => throw _privateConstructorUsedError;
  List<Question> get weakQuestionList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeakQuestionListCopyWith<WeakQuestionList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeakQuestionListCopyWith<$Res> {
  factory $WeakQuestionListCopyWith(
          WeakQuestionList value, $Res Function(WeakQuestionList) then) =
      _$WeakQuestionListCopyWithImpl<$Res, WeakQuestionList>;
  @useResult
  $Res call(
      {String? id,
      List<Question> weakQuestionList,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$WeakQuestionListCopyWithImpl<$Res, $Val extends WeakQuestionList>
    implements $WeakQuestionListCopyWith<$Res> {
  _$WeakQuestionListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? weakQuestionList = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      weakQuestionList: null == weakQuestionList
          ? _value.weakQuestionList
          : weakQuestionList // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeakQuestionListCopyWith<$Res>
    implements $WeakQuestionListCopyWith<$Res> {
  factory _$$_WeakQuestionListCopyWith(
          _$_WeakQuestionList value, $Res Function(_$_WeakQuestionList) then) =
      __$$_WeakQuestionListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      List<Question> weakQuestionList,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$_WeakQuestionListCopyWithImpl<$Res>
    extends _$WeakQuestionListCopyWithImpl<$Res, _$_WeakQuestionList>
    implements _$$_WeakQuestionListCopyWith<$Res> {
  __$$_WeakQuestionListCopyWithImpl(
      _$_WeakQuestionList _value, $Res Function(_$_WeakQuestionList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? weakQuestionList = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$_WeakQuestionList(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      weakQuestionList: null == weakQuestionList
          ? _value._weakQuestionList
          : weakQuestionList // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeakQuestionList extends _WeakQuestionList {
  _$_WeakQuestionList(
      {this.id,
      required final List<Question> weakQuestionList,
      this.isLoading = false,
      this.error})
      : _weakQuestionList = weakQuestionList,
        super._();

  factory _$_WeakQuestionList.fromJson(Map<String, dynamic> json) =>
      _$$_WeakQuestionListFromJson(json);

  @override
  final String? id;
  final List<Question> _weakQuestionList;
  @override
  List<Question> get weakQuestionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weakQuestionList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'WeakQuestionList(id: $id, weakQuestionList: $weakQuestionList, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeakQuestionList &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._weakQuestionList, _weakQuestionList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_weakQuestionList), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeakQuestionListCopyWith<_$_WeakQuestionList> get copyWith =>
      __$$_WeakQuestionListCopyWithImpl<_$_WeakQuestionList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeakQuestionListToJson(
      this,
    );
  }
}

abstract class _WeakQuestionList extends WeakQuestionList {
  factory _WeakQuestionList(
      {final String? id,
      required final List<Question> weakQuestionList,
      final bool isLoading,
      final String? error}) = _$_WeakQuestionList;
  _WeakQuestionList._() : super._();

  factory _WeakQuestionList.fromJson(Map<String, dynamic> json) =
      _$_WeakQuestionList.fromJson;

  @override
  String? get id;
  @override
  List<Question> get weakQuestionList;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_WeakQuestionListCopyWith<_$_WeakQuestionList> get copyWith =>
      throw _privateConstructorUsedError;
}
