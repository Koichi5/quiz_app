import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity/signup_entity/signup_entity.dart';

part 'signup_form_state.freezed.dart';

@freezed
class SignupFormState with _$SignupFormState {
  const factory SignupFormState(SignupEntity form) = _SignupFormState;
}