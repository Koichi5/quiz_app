import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nameControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: "");
});

final emailControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final passwordControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final obscureTextStateProvider = StateProvider.autoDispose((ref) => true);