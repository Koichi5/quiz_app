import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/quiz/quiz.dart';
import 'package:quiz_app/domain/repository/quiz_repository.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';

import '../../domain/question/question.dart';

final questionExceptionProvider = StateProvider<CustomException?>((_) => null);

final questionControllerProvider = StateNotifierProvider.family
    .autoDispose<QuestionController, AsyncValue<List<Question>>, Quiz>((ref, quiz) {
  final user = ref.watch(authControllerProvider);
  return QuestionController(ref.read, user?.uid, quiz);
});

class QuestionController extends StateNotifier<AsyncValue<List<Question>>> {
  final Reader _reader;
  final String? _userId;
  final Quiz quiz;

  QuestionController(this._reader, this._userId, this.quiz)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveQuestionList(quiz: quiz);
    }
  }

  Future<void> retrieveQuestionList({required Quiz quiz}) async {
    try {
      final questionList = await _reader(quizRepositoryProvider)
          .retrieveQuestionList(quiz: quiz);
      if (mounted) {
        state = AsyncValue.data(questionList);
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<Question?> addQuestion({
    required String id,
    required String text,
    required int duration,
    required bool optionsShuffled,
  }) async {
    final question = Question(
        id: id,
        text: text,
        duration: duration,
        optionsShuffled: optionsShuffled,
        options: []);
    state.whenData((questionList) => state = AsyncValue.data(questionList
      ..add(question.copyWith(questionDocRef: question.questionDocRef))));
  }
}
