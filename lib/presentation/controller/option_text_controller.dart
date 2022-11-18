import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final optionIdControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final optionTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});