import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/field/field.dart';

import '../../../domain/entity/quiz_form_entity/quiz_form_entity.dart';
import '../../../domain/quiz_form_state/quiz_form_state.dart';

final quizValidatorProvider =
    StateNotifierProvider<QuizValidatorProvider, QuizFormState>(
        (ref) => QuizValidatorProvider());

class QuizValidatorProvider extends StateNotifier<QuizFormState> {
  QuizValidatorProvider() : super(QuizFormState(QuizFormEntity.empty()));

  void setQuizId(String quizId) {
    final bool isQuizId = RegExp("[0-9]").hasMatch(quizId);
    QuizFormEntity form = state.form.copyWith(id: Field(value: quizId));

    late Field quizIdField;

    if (isQuizId) {
      quizIdField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      quizIdField =
          form.id.copyWith(isValid: false, errorMessage: "クイズIDには数字を指定してください");
    }
    state = state.copyWith(form: form.copyWith(id: quizIdField));
  }

  void setQuizTitle(String quizTitle) {
    final bool isQuizTitle = quizTitle != "";
    QuizFormEntity form = state.form.copyWith(title: Field(value: quizTitle));

    late Field quizTitleField;

    if (isQuizTitle) {
      quizTitleField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      quizTitleField =
          form.id.copyWith(isValid: false, errorMessage: "クイズのタイトルが入力されていません");
    }
    state = state.copyWith(form: form.copyWith(title: quizTitleField));
  }

  void setQuizDescription(String quizDescription) {
    final bool isQuizDescription = quizDescription != "";
    QuizFormEntity form =
        state.form.copyWith(description: Field(value: quizDescription));

    late Field quizDescriptionField;

    if (isQuizDescription) {
      quizDescriptionField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      quizDescriptionField =
          form.id.copyWith(isValid: false, errorMessage: "クイズの説明が入力されていません");
    }
    state =
        state.copyWith(form: form.copyWith(description: quizDescriptionField));
  }

  void setQuizCategoryId(String quizCategoryId) {
    final bool isQuizCategoryId = RegExp("[0-9]").hasMatch(quizCategoryId);
    QuizFormEntity form =
        state.form.copyWith(categoryId: Field(value: quizCategoryId));

    late Field quizCategoryIdField;

    if (isQuizCategoryId) {
      quizCategoryIdField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      quizCategoryIdField = form.id
          .copyWith(isValid: false, errorMessage: "クイズのカテゴリIDには数字を指定してください");
    }
    state =
        state.copyWith(form: form.copyWith(categoryId: quizCategoryIdField));
  }
}
