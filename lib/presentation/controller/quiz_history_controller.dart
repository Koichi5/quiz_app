import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:quiz_app/domain/repository/quiz_repository.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';

import '../../domain/category/category.dart';
import '../../domain/quiz/quiz.dart';
import '../../domain/quiz_history/quiz_history.dart';

final quizHistoryExceptionProvider =
    StateProvider<CustomException?>((_) => null);

final quizHistoryControllerProvider =
    StateNotifierProvider<QuizHistoryController, AsyncValue<List<QuizHistory>>>(
        (ref) {
  final user = ref.watch(authControllerProvider);
  return QuizHistoryController(ref.read, user?.uid);
});

class QuizHistoryController
    extends StateNotifier<AsyncValue<List<QuizHistory>>> {
  final Reader _reader;
  final String? _userId;
  QuizHistoryController(this._reader, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveQuizHistoryList();
    }
  }

  Future<List<QuizHistory>> retrieveQuizHistoryList() async {
    try {
      final quizHistoryList =
          await _reader(quizRepositoryProvider).retrieveQuizHistory();
      if (mounted) {
        state = AsyncValue.data(quizHistoryList);
      }
      return quizHistoryList;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<String> addQuizHistory(
      {required User user,
      required String quizDocRef,
      required String categoryDocRef,
      required String quizTitle,
      required String score,
      required String timeTaken,
      required DateTime quizDate,
      required String status}) async {
    final quizHistory = QuizHistory(
        quizDocRef: quizDocRef,
        categoryDocRef: categoryDocRef,
        quizTitle: quizTitle,
        score: score,
        timeTaken: timeTaken,
        quizDate: quizDate,
        status: status);
    final quizHistoryDocRef = await _reader(quizRepositoryProvider)
        .addQuizHistory(quizHistory: quizHistory, user: user);
    state.whenData((categoryList) => state = AsyncValue.data(
        categoryList..add(quizHistory.copyWith(id: quizHistoryDocRef))));
    return quizHistoryDocRef;
  }
}
