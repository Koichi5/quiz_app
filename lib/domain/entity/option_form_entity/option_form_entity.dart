import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'option_form_entity.freezed.dart';

@freezed
class OptionFormEntity with _$OptionFormEntity {
  const OptionFormEntity._();
  const factory OptionFormEntity({
    required Field id,
    required Field text,
  }) = _OptionFormEntity;

  factory OptionFormEntity.empty() => const OptionFormEntity(
    id: Field(value: ""),
    text: Field(value: ""),
  );
  bool get isValid => text.isValid;
}