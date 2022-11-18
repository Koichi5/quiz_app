import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity/login_form_entity/login_form_entity.dart';

part 'login_form_state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState(LoginFormEntity form) = _LoginFormState;
}