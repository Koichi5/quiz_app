// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String? get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String? get categoryDocRef => throw _privateConstructorUsedError;
  String? get quizDocRef => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get categoryQuestionCount => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String? id,
      int categoryId,
      String? categoryDocRef,
      String? quizDocRef,
      String name,
      String description,
      int categoryQuestionCount,
      String imagePath,
      DateTime createdAt});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? description = null,
    Object? categoryQuestionCount = null,
    Object? imagePath = null,
    Object? createdAt = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryQuestionCount: null == categoryQuestionCount
          ? _value.categoryQuestionCount
          : categoryQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int categoryId,
      String? categoryDocRef,
      String? quizDocRef,
      String name,
      String description,
      int categoryQuestionCount,
      String imagePath,
      DateTime createdAt});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = null,
    Object? categoryDocRef = freezed,
    Object? quizDocRef = freezed,
    Object? name = null,
    Object? description = null,
    Object? categoryQuestionCount = null,
    Object? imagePath = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Category(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryQuestionCount: null == categoryQuestionCount
          ? _value.categoryQuestionCount
          : categoryQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category extends _Category {
  const _$_Category(
      {this.id,
      required this.categoryId,
      this.categoryDocRef,
      this.quizDocRef,
      required this.name,
      required this.description,
      required this.categoryQuestionCount,
      required this.imagePath,
      required this.createdAt})
      : super._();

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final String? id;
  @override
  final int categoryId;
  @override
  final String? categoryDocRef;
  @override
  final String? quizDocRef;
  @override
  final String name;
  @override
  final String description;
  @override
  final int categoryQuestionCount;
  @override
  final String imagePath;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Category(id: $id, categoryId: $categoryId, categoryDocRef: $categoryDocRef, quizDocRef: $quizDocRef, name: $name, description: $description, categoryQuestionCount: $categoryQuestionCount, imagePath: $imagePath, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryDocRef, categoryDocRef) ||
                other.categoryDocRef == categoryDocRef) &&
            (identical(other.quizDocRef, quizDocRef) ||
                other.quizDocRef == quizDocRef) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryQuestionCount, categoryQuestionCount) ||
                other.categoryQuestionCount == categoryQuestionCount) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      categoryDocRef,
      quizDocRef,
      name,
      description,
      categoryQuestionCount,
      imagePath,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category extends Category {
  const factory _Category(
      {final String? id,
      required final int categoryId,
      final String? categoryDocRef,
      final String? quizDocRef,
      required final String name,
      required final String description,
      required final int categoryQuestionCount,
      required final String imagePath,
      required final DateTime createdAt}) = _$_Category;
  const _Category._() : super._();

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String? get id;
  @override
  int get categoryId;
  @override
  String? get categoryDocRef;
  @override
  String? get quizDocRef;
  @override
  String get name;
  @override
  String get description;
  @override
  int get categoryQuestionCount;
  @override
  String get imagePath;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
