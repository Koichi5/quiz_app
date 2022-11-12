import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'signup_entity.freezed.dart';

@freezed
class SignupEntity with _$SignupEntity {
  const SignupEntity._();
  const factory SignupEntity({
    required Field name,
    required Field email,
    required Field password,
  }) = _SignupEntity;

  factory SignupEntity.empty() => const SignupEntity(
    name: Field(value: ""),
    email: Field(value: ""),
    password: Field(value: ""),
  );
  bool get isValid => email.isValid && password.isValid && name.isValid;
}