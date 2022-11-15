import 'package:freezed_annotation/freezed_annotation.dart';
import '../../field/field.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const LoginEntity._();
  const factory LoginEntity({
    required Field email,
    required Field password,
  }) = _LoginEntity;

  factory LoginEntity.empty() => const LoginEntity(
    email: Field(value: ""),
    password: Field(value: ""),
  );
  bool get isValid => email.isValid && password.isValid;
}