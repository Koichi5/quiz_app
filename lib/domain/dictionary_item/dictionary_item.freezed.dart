// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DictionaryItem _$DictionaryItemFromJson(Map<String, dynamic> json) {
  return _DictionaryItem.fromJson(json);
}

/// @nodoc
mixin _$DictionaryItem {
  String? get id => throw _privateConstructorUsedError;
  String get dictionaryWord => throw _privateConstructorUsedError;
  String get dictionaryDescription => throw _privateConstructorUsedError;
  String get dictionaryUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DictionaryItemCopyWith<DictionaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DictionaryItemCopyWith<$Res> {
  factory $DictionaryItemCopyWith(
          DictionaryItem value, $Res Function(DictionaryItem) then) =
      _$DictionaryItemCopyWithImpl<$Res, DictionaryItem>;
  @useResult
  $Res call(
      {String? id,
      String dictionaryWord,
      String dictionaryDescription,
      String dictionaryUrl});
}

/// @nodoc
class _$DictionaryItemCopyWithImpl<$Res, $Val extends DictionaryItem>
    implements $DictionaryItemCopyWith<$Res> {
  _$DictionaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dictionaryWord = null,
    Object? dictionaryDescription = null,
    Object? dictionaryUrl = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dictionaryWord: null == dictionaryWord
          ? _value.dictionaryWord
          : dictionaryWord // ignore: cast_nullable_to_non_nullable
              as String,
      dictionaryDescription: null == dictionaryDescription
          ? _value.dictionaryDescription
          : dictionaryDescription // ignore: cast_nullable_to_non_nullable
              as String,
      dictionaryUrl: null == dictionaryUrl
          ? _value.dictionaryUrl
          : dictionaryUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DictionaryItemCopyWith<$Res>
    implements $DictionaryItemCopyWith<$Res> {
  factory _$$_DictionaryItemCopyWith(
          _$_DictionaryItem value, $Res Function(_$_DictionaryItem) then) =
      __$$_DictionaryItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String dictionaryWord,
      String dictionaryDescription,
      String dictionaryUrl});
}

/// @nodoc
class __$$_DictionaryItemCopyWithImpl<$Res>
    extends _$DictionaryItemCopyWithImpl<$Res, _$_DictionaryItem>
    implements _$$_DictionaryItemCopyWith<$Res> {
  __$$_DictionaryItemCopyWithImpl(
      _$_DictionaryItem _value, $Res Function(_$_DictionaryItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dictionaryWord = null,
    Object? dictionaryDescription = null,
    Object? dictionaryUrl = null,
  }) {
    return _then(_$_DictionaryItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dictionaryWord: null == dictionaryWord
          ? _value.dictionaryWord
          : dictionaryWord // ignore: cast_nullable_to_non_nullable
              as String,
      dictionaryDescription: null == dictionaryDescription
          ? _value.dictionaryDescription
          : dictionaryDescription // ignore: cast_nullable_to_non_nullable
              as String,
      dictionaryUrl: null == dictionaryUrl
          ? _value.dictionaryUrl
          : dictionaryUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DictionaryItem extends _DictionaryItem {
  const _$_DictionaryItem(
      {this.id,
      required this.dictionaryWord,
      required this.dictionaryDescription,
      required this.dictionaryUrl})
      : super._();

  factory _$_DictionaryItem.fromJson(Map<String, dynamic> json) =>
      _$$_DictionaryItemFromJson(json);

  @override
  final String? id;
  @override
  final String dictionaryWord;
  @override
  final String dictionaryDescription;
  @override
  final String dictionaryUrl;

  @override
  String toString() {
    return 'DictionaryItem(id: $id, dictionaryWord: $dictionaryWord, dictionaryDescription: $dictionaryDescription, dictionaryUrl: $dictionaryUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DictionaryItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dictionaryWord, dictionaryWord) ||
                other.dictionaryWord == dictionaryWord) &&
            (identical(other.dictionaryDescription, dictionaryDescription) ||
                other.dictionaryDescription == dictionaryDescription) &&
            (identical(other.dictionaryUrl, dictionaryUrl) ||
                other.dictionaryUrl == dictionaryUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, dictionaryWord, dictionaryDescription, dictionaryUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DictionaryItemCopyWith<_$_DictionaryItem> get copyWith =>
      __$$_DictionaryItemCopyWithImpl<_$_DictionaryItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DictionaryItemToJson(
      this,
    );
  }
}

abstract class _DictionaryItem extends DictionaryItem {
  const factory _DictionaryItem(
      {final String? id,
      required final String dictionaryWord,
      required final String dictionaryDescription,
      required final String dictionaryUrl}) = _$_DictionaryItem;
  const _DictionaryItem._() : super._();

  factory _DictionaryItem.fromJson(Map<String, dynamic> json) =
      _$_DictionaryItem.fromJson;

  @override
  String? get id;
  @override
  String get dictionaryWord;
  @override
  String get dictionaryDescription;
  @override
  String get dictionaryUrl;
  @override
  @JsonKey(ignore: true)
  _$$_DictionaryItemCopyWith<_$_DictionaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
