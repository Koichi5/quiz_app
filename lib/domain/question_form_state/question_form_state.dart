import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/question_form_entity/question_form_entity.dart';


part 'question_form_state.freezed.dart';

@freezed
class QuestionFormState with _$QuestionFormState {
  const factory QuestionFormState(QuestionFormEntity form) = _QuestionFormState;
}