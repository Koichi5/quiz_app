import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'quiz_form_entity.freezed.dart';

@freezed
class QuizFormEntity with _$QuizFormEntity {
  const QuizFormEntity._();
  const factory QuizFormEntity({
    required Field id,
    required Field title,
    required Field description,
    required Field categoryId,
    String? imagePath,
  }) = _QuizFormEntity;

  factory QuizFormEntity.empty() => const QuizFormEntity(
    id: Field(value: ""),
    title: Field(value: ""),
    description: Field(value: ""),
    categoryId: Field(value: ""),
  );
  bool get isValid => title.isValid && description.isValid;
}