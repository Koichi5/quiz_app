import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'signup_form_entity.freezed.dart';

@freezed
class SignupFormEntity with _$SignupFormEntity {
  const SignupFormEntity._();
  const factory SignupFormEntity({
    required Field name,
    required Field email,
    required Field password,
  }) = _SignupFormEntity;

  factory SignupFormEntity.empty() => const SignupFormEntity(
    name: Field(value: ""),
    email: Field(value: ""),
    password: Field(value: ""),
  );
  bool get isValid => email.isValid && password.isValid;
}