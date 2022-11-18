import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final quizIdControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final quizTitleControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final quizDescriptionControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final quizCategoryIdControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});