import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/quiz_form_entity/quiz_form_entity.dart';


part 'quiz_form_state.freezed.dart';

@freezed
class QuizFormState with _$QuizFormState {
  const factory QuizFormState(QuizFormEntity form) = _QuizFormState;
}