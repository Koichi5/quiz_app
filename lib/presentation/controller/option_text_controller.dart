import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final optionIdControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

//  1 + 1 = ?

// 1
// 2 true
// 3
// 4

final firstOptionTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final firstOptionIsCorrectProvider = StateProvider.autoDispose((ref) => false);

final secondOptionTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final secondOptionIsCorrectProvider = StateProvider.autoDispose((ref) => false);

final thirdOptionTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final thirdOptionIsCorrectProvider = StateProvider.autoDispose((ref) => false);

final fourthOptionTextControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final fourthOptionIsCorrectProvider = StateProvider.autoDispose((ref) => false);