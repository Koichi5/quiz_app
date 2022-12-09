// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'option_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OptionSelection {
  bool get isSelected => throw _privateConstructorUsedError;
  String get optionText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OptionSelectionCopyWith<OptionSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionSelectionCopyWith<$Res> {
  factory $OptionSelectionCopyWith(
          OptionSelection value, $Res Function(OptionSelection) then) =
      _$OptionSelectionCopyWithImpl<$Res, OptionSelection>;
  @useResult
  $Res call({bool isSelected, String optionText});
}

/// @nodoc
class _$OptionSelectionCopyWithImpl<$Res, $Val extends OptionSelection>
    implements $OptionSelectionCopyWith<$Res> {
  _$OptionSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSelected = null,
    Object? optionText = null,
  }) {
    return _then(_value.copyWith(
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      optionText: null == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OptionSelectionCopyWith<$Res>
    implements $OptionSelectionCopyWith<$Res> {
  factory _$$_OptionSelectionCopyWith(
          _$_OptionSelection value, $Res Function(_$_OptionSelection) then) =
      __$$_OptionSelectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSelected, String optionText});
}

/// @nodoc
class __$$_OptionSelectionCopyWithImpl<$Res>
    extends _$OptionSelectionCopyWithImpl<$Res, _$_OptionSelection>
    implements _$$_OptionSelectionCopyWith<$Res> {
  __$$_OptionSelectionCopyWithImpl(
      _$_OptionSelection _value, $Res Function(_$_OptionSelection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSelected = null,
    Object? optionText = null,
  }) {
    return _then(_$_OptionSelection(
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      optionText: null == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OptionSelection implements _OptionSelection {
  const _$_OptionSelection(
      {required this.isSelected, required this.optionText});

  @override
  final bool isSelected;
  @override
  final String optionText;

  @override
  String toString() {
    return 'OptionSelection(isSelected: $isSelected, optionText: $optionText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionSelection &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.optionText, optionText) ||
                other.optionText == optionText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSelected, optionText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionSelectionCopyWith<_$_OptionSelection> get copyWith =>
      __$$_OptionSelectionCopyWithImpl<_$_OptionSelection>(this, _$identity);
}

abstract class _OptionSelection implements OptionSelection {
  const factory _OptionSelection(
      {required final bool isSelected,
      required final String optionText}) = _$_OptionSelection;

  @override
  bool get isSelected;
  @override
  String get optionText;
  @override
  @JsonKey(ignore: true)
  _$$_OptionSelectionCopyWith<_$_OptionSelection> get copyWith =>
      throw _privateConstructorUsedError;
}
