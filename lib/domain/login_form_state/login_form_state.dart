import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity/login_entity/login_entity.dart';

part 'login_form_state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState(LoginEntity form) = _LoginFormState;
}