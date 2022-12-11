import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../weak_question/weak_question.dart';

abstract class BaseWeakQuestionRepository {
  Future<String> addWeakQuestion(
      {required String userId, required WeakQuestion weakQuestion});
  Future deleteWeakQuestion(
      {required String userId, required WeakQuestion weakQuestion});
  Future<List<WeakQuestion>> retrieveWeakQuestionList();
}

final weakQuestionRepositoryProvider =
    Provider<WeakQuestionRepository>((ref) => WeakQuestionRepository(ref.read));

class WeakQuestionRepository implements BaseWeakQuestionRepository {
  final Reader _reader;

  WeakQuestionRepository(this._reader);

  @override
  Future<String> addWeakQuestion(
      {required String userId, required WeakQuestion weakQuestion}) async {
    try {
      final weakQuestionRef = _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(userId)
          .collection("weakQuestion");
      final weakQuestionDocRef = weakQuestionRef.doc().id;
      await weakQuestionRef.doc(weakQuestionDocRef).set(WeakQuestion(
            id: weakQuestion.id,
            categoryDocRef: weakQuestion.categoryDocRef,
            quizDocRef: weakQuestion.quizDocRef,
            questionDocRef: weakQuestion.questionDocRef,
            weakQuestionDocRef: weakQuestionDocRef,
          ).toDocument());
      return weakQuestionDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future deleteWeakQuestion(
      {required String userId, required WeakQuestion weakQuestion}) async {
    try {
      await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(userId)
          .collection("weakQuestion")
          .doc(weakQuestion.weakQuestionDocRef)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<WeakQuestion>> retrieveWeakQuestionList() async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .collection("weakQuestion")
          .get();
      return snap.docs.map((doc) => WeakQuestion.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
