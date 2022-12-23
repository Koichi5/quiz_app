import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'question_form_entity.freezed.dart';

@freezed
class QuestionFormEntity with _$QuestionFormEntity {
  const QuestionFormEntity._();
  const factory QuestionFormEntity({
    required Field id,
    required Field text,
    // required Field duration,
  }) = _QuestionFormEntity;

  factory QuestionFormEntity.empty() => const QuestionFormEntity(
    id: Field(value: ""),
    text: Field(value: ""),
    // duration: Field(value: ""),
  );
  bool get isValid => text.isValid;
      // && duration.isValid
}