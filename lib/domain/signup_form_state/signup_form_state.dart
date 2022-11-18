import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity/signup_form_entity/signup_form_entity.dart';

part 'signup_form_state.freezed.dart';

@freezed
class SignupFormState with _$SignupFormState {
  const factory SignupFormState(SignupFormEntity form) = _SignupFormState;
}