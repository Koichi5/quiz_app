import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/field/field.dart';

import '../../../domain/entity/question_form_entity/question_form_entity.dart';
import '../../../domain/question_form_state/question_form_state.dart';

final questionValidatorProvider =
    StateNotifierProvider<QuestionValidatorProvider, QuestionFormState>(
        (ref) => QuestionValidatorProvider());

class QuestionValidatorProvider extends StateNotifier<QuestionFormState> {
  QuestionValidatorProvider()
      : super(QuestionFormState(QuestionFormEntity.empty()));

  void setQuestionId(String questionId) {
    final bool isQuestionId = RegExp("[0-9]").hasMatch(questionId);
    QuestionFormEntity form = state.form.copyWith(id: Field(value: questionId));

    late Field questionIdField;

    if (isQuestionId) {
      questionIdField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      questionIdField =
          form.id.copyWith(isValid: false, errorMessage: "問題のIDには数字を指定してください");
    }
    state = state.copyWith(form: form.copyWith(id: questionIdField));
  }

  void setQuestionText(String questionText) {
    final bool isQuestionText = questionText != "";
    QuestionFormEntity form =
        state.form.copyWith(text: Field(value: questionText));

    late Field questionTextField;

    if (isQuestionText) {
      questionTextField = form.id.copyWith(isValid: true, errorMessage: "");
    } else {
      questionTextField =
          form.id.copyWith(isValid: false, errorMessage: "問題文が入力されていません");
    }
    state = state.copyWith(form: form.copyWith(text: questionTextField));
  }

  // void setQuestionDuration(String questionDuration) {
  //   final bool isQuestionDuration = RegExp("[0-9]").hasMatch(questionDuration);
  //   QuestionFormEntity form =
  //       state.form.copyWith(duration: Field(value: questionDuration));
  //
  //   late Field questionDurationField;
  //
  //   if (isQuestionDuration) {
  //     questionDurationField = form.id.copyWith(isValid: true, errorMessage: "");
  //   } else {
  //     questionDurationField = form.id
  //         .copyWith(isValid: false, errorMessage: "クイズの制限時間は数字で入力してください");
  //   }
  //   state =
  //       state.copyWith(form: form.copyWith(duration: questionDurationField));
  // }
}
