import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../quiz_history/quiz_history.dart';

abstract class BaseQuizHistoryRepository {
  Future<String> addQuizHistory(
      {required User user, required QuizHistory quizHistory});
  Future<List<QuizHistory>> retrieveQuizHistoryList();
}

final quizHistoryRepositoryProvider =
    Provider<QuizHistoryRepository>((ref) => QuizHistoryRepository(ref.read));

class QuizHistoryRepository implements BaseQuizHistoryRepository {
  final Reader _reader;

  QuizHistoryRepository(this._reader);

  @override
  Future<String> addQuizHistory(
      {required User user, required QuizHistory quizHistory}) async {
    try {
      final quizHistoryRef = _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(user.uid)
          .collection("quizHistory");
      final quizHistoryDocRef = quizHistoryRef.doc().id;
      // await quizHistoryRef.add(quizHistory.toDocument());
      await quizHistoryRef.doc(quizHistoryDocRef).set(QuizHistory(
            id: quizHistory.id,
            quizDocRef: quizHistory.quizDocRef,
            categoryDocRef: quizHistory.categoryDocRef,
            quizTitle: quizHistory.quizTitle,
            score: quizHistory.score,
            timeTaken: quizHistory.timeTaken,
            quizDate: quizHistory.quizDate,
            status: quizHistory.status,
          ).toDocument());
      return quizHistoryDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<QuizHistory>> retrieveQuizHistoryList() async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .collection("quizHistory")
          .get();
      return snap.docs.map((doc) => QuizHistory.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
