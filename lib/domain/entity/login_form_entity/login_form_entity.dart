import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'login_form_entity.freezed.dart';

@freezed
class LoginFormEntity with _$LoginFormEntity {
  const LoginFormEntity._();
  const factory LoginFormEntity({
    required Field email,
    required Field password,
  }) = _LoginFormEntity;

  factory LoginFormEntity.empty() => const LoginFormEntity(
    email: Field(value: ""),
    password: Field(value: ""),
  );
  bool get isValid => email.isValid && password.isValid;
}