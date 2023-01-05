// original_question_repository
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/question/question.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';

abstract class BaseOriginalQuestionRepository {
  Future<Question> addOriginalQuestion(
      {required String userId, required Question question});
  Future<List<Question>> retrieveOriginalQuestionList({required String userId});
  Future<void> deleteOriginalQuestion(
      {required String userId, required String originalQuestionDocRef});
}

final originalQuestionRepositoryProvider = Provider<OriginalQuestionRepository>(
    (ref) => OriginalQuestionRepository(ref.read));

class OriginalQuestionRepository implements BaseOriginalQuestionRepository {
  final Reader _reader;

  OriginalQuestionRepository(this._reader);

  @override
  Future<Question> addOriginalQuestion(
      {required String userId, required Question question}) async {
    try {
      final originalQuestionRef = _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(userId)
          .collection("originalQuestion");

      final originalQuestionWithDocRef = Question(
        id: question.id,
        text: question.text,
        originalQuestionDocRef: "",
        duration: question.duration,
        optionsShuffled: question.optionsShuffled,
        options: [],
      );
      // originalQuestionDocRef が正しく記録されるために一度 originalQuestionDocRef を含まない状態で add する
      final originalQuestion = await originalQuestionRef
          .add(originalQuestionWithDocRef.toDocument());
      // add した後にドキュメントIDの取得を行い、 update で反映させる
      final originalQuestionDocRef = originalQuestion.id;

      await originalQuestionRef.doc(originalQuestionDocRef).update({
        "options":
            question.options.map((option) => option.toDocument()).toList(),
        "originalQuestionDocRef": originalQuestionDocRef,
      });
      return originalQuestionWithDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Question>> retrieveOriginalQuestionList(
      {required String userId}) async {
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(userId)
          .collection("originalQuestion")
          .get();
      return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteOriginalQuestion(
      {required String userId, required String originalQuestionDocRef}) async {
    try {
      await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(userId)
          .collection("originalQuestion")
          .doc(originalQuestionDocRef)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  //
  // @override
  // Future<Question> retrieveOriginalQuestionById(
  //     {required String userId, required String originalQuestionDocRef}) async {
  //   try {
  //     final snap = await _reader(firebaseFirestoreProvider)
  //         .collection("user")
  //         .doc(userId)
  //         .collection("originalQuestion")
  //         .doc(originalQuestionDocRef)
  //         .get();
  //     return Question.fromDocument(snap);
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }
}
