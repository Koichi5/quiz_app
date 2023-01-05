import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/option/option.dart';
import 'package:quiz_app/domain/repository/original_question_repository.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';
import 'package:quiz_app/presentation/controller/option_text_controller.dart';

import '../../domain/question/question.dart';

final originalQuestionExceptionProvider =
    StateProvider<CustomException?>((_) => null);

final originalQuestionControllerProvider = StateNotifierProvider.autoDispose<
    OriginalQuestionController, AsyncValue<List<Question>>>((ref) {
  final user = ref.watch(authControllerProvider);
  return OriginalQuestionController(ref.read, user?.uid);
});

class OriginalQuestionController
    extends StateNotifier<AsyncValue<List<Question>>> {
  final Reader _reader;
  final String? _userId;

  OriginalQuestionController(this._reader, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveOriginalQuestionList();
    }
  }

  Future<void> retrieveOriginalQuestionList() async {
    try {
      final originalQuestionList =
          await _reader(originalQuestionRepositoryProvider)
              .retrieveOriginalQuestionList(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(originalQuestionList);
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<Question?> addOriginalQuestion({
    String? id,
    required String text,
    required String duration,
    required bool optionsShuffled,
  }) async {
    final originalQuestion = Question(
      id: id,
      text: text,
      duration: int.parse(duration),
      optionsShuffled: optionsShuffled,
      options: [
        Option(
            text: _reader(firstOptionTextControllerProvider).text,
            isCorrect: _reader(firstOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(secondOptionTextControllerProvider).text,
            isCorrect: _reader(secondOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(thirdOptionTextControllerProvider).text,
            isCorrect: _reader(thirdOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(fourthOptionTextControllerProvider).text,
            isCorrect: _reader(fourthOptionIsCorrectProvider),
            isSelected: false),
      ],
    );
    if (_reader(firstOptionIsCorrectProvider) ||
        _reader(secondOptionIsCorrectProvider) ||
        _reader(thirdOptionIsCorrectProvider) ||
        _reader(fourthOptionIsCorrectProvider)) {
      final originalQuestionWithDocRef =
          await _reader(originalQuestionRepositoryProvider).addOriginalQuestion(
              userId: _userId!, question: originalQuestion);
      state.whenData((originalQuestionList) => state = AsyncValue.data(
          originalQuestionList
            ..add(
                originalQuestion.copyWith(id: originalQuestionWithDocRef.id))));
      return originalQuestion;
    } else {
      return null;
    }
  }

  Future<void> deleteOriginalQuestion(
      {required String originalQuestionDocRef}) async {
    try {
      await _reader(originalQuestionRepositoryProvider).deleteOriginalQuestion(
          userId: _userId!, originalQuestionDocRef: originalQuestionDocRef);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
