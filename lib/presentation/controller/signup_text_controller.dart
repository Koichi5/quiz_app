import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signupNameControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: "");
});

final signupEmailControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final signupPasswordControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final signupObscureTextStateProvider = StateProvider.autoDispose((ref) => true);