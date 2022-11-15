import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginEmailControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final loginPasswordControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final loginObscureTextStateProvider = StateProvider.autoDispose((ref) => true);