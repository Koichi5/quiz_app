import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/category_form_entity/category_form_entity.dart';

part 'category_form_state.freezed.dart';

@freezed
class CategoryFormState with _$CategoryFormState {
  const factory CategoryFormState(CategoryFormEntity form) = _CategoryFormState;
}