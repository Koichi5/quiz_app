import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/field/field.dart';

import '../../../domain/category_form_state/category_form_state.dart';
import '../../../domain/entity/category_form_entity/category_form_entity.dart';

final categoryValidatorProvider =
    StateNotifierProvider<CategoryValidatorProvider, CategoryFormState>(
        (ref) => CategoryValidatorProvider());

class CategoryValidatorProvider extends StateNotifier<CategoryFormState> {
  CategoryValidatorProvider()
      : super(CategoryFormState(CategoryFormEntity.empty()));

  void setCategoryId(String categoryId) {
    final bool isCategoryId = RegExp("[0-9]").hasMatch(categoryId);
    CategoryFormEntity form = state.form.copyWith(id: Field(value: categoryId));

    late Field categoryIdField;

    if (isCategoryId) {
      categoryIdField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      categoryIdField =
          form.id.copyWith(isValid: false, errorMessage: "カテゴリIDには数字を指定してください");
    }
    state = state.copyWith(form: form.copyWith(id: categoryIdField));
  }

  void setCategoryName(String categoryName) {
    final bool isCategoryName = categoryName != "";
    CategoryFormEntity form = state.form.copyWith(name: Field(value: categoryName));

    late Field categoryNameField;

    if(isCategoryName) {
      categoryNameField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      categoryNameField = form.id.copyWith(isValid: false, errorMessage: "カテゴリ名が入力されていません");
    }
    state = state.copyWith(form: form.copyWith(name: categoryNameField));
  }

  void setCategoryDescription(String categoryDescription) {
    final bool isCategoryDescription = categoryDescription != "";
    CategoryFormEntity form = state.form.copyWith(name: Field(value: categoryDescription));

    late Field categoryDescriptionField;

    if(isCategoryDescription) {
      categoryDescriptionField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      categoryDescriptionField = form.id.copyWith(isValid: false, errorMessage: "カテゴリ名が入力されていません");
    }
    state = state.copyWith(form: form.copyWith(name: categoryDescriptionField));
  }
}
