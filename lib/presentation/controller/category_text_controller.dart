import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryIdControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final categoryNameControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final categoryDescriptionControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
