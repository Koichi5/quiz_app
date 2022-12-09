import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';

import '../../domain/repository/weak_question_repository.dart';
import '../../domain/weak_question/weak_question.dart';

final weakQuestionExceptionProvider = StateProvider<CustomException?>((_) => null);


final weakQuestionControllerProvider =
StateNotifierProvider<WeakQuestionController, AsyncValue<List<WeakQuestion>>>(
        (ref) {
      final user = ref.watch(authControllerProvider);
      return WeakQuestionController(ref.read, user?.uid);
    });

class WeakQuestionController
    extends StateNotifier<AsyncValue<List<WeakQuestion>>> {
  final Reader _reader;
  final String? _userId;
  WeakQuestionController(this._reader, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveWeakQuestionList();
    }
  }

  Future<List<WeakQuestion>> retrieveWeakQuestionList() async {
    try {
      final weakQuestionList = await _reader(weakQuestionRepositoryProvider)
          .retrieveWeakQuestionList();
      if (mounted) {
        state = AsyncValue.data(weakQuestionList);
      }
      return weakQuestionList;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<String> addWeakQuestion({
    required String quizDocRef,
    required String categoryDocRef,
    required String questionDocRef,
  }) async {
    final weakQuestion = WeakQuestion(
      quizDocRef: quizDocRef,
      categoryDocRef: categoryDocRef,
      questionDocRef: questionDocRef,
    );
    final weakQuestionDocRef = await _reader(weakQuestionRepositoryProvider)
        .addWeakQuestion(userId: _userId!, weakQuestion: weakQuestion);
    state.whenData((weakQuestionList) => state = AsyncValue.data(
        weakQuestionList..add( weakQuestion.copyWith(id: weakQuestionDocRef))));
    return weakQuestionDocRef;
  }
}

