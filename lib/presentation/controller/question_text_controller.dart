import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final questionIdControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final questionTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final questionDurationControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});