import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/question/question.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../quiz/quiz.dart';

abstract class BaseQuestionRepository {
  Future<Question> addQuestion(
      {required Quiz quiz, required Question question});
  Future<List<Question>> retrieveQuestionList({required Quiz quiz});
}

final questionRepositoryProvider =
    Provider<QuestionRepository>((ref) => QuestionRepository(ref.read));

class QuestionRepository implements BaseQuestionRepository {
  final Reader _reader;
  QuestionRepository(this._reader);

  @override
  Future<Question> addQuestion(
      {required Quiz quiz, required Question question}) async {
    try {
      final questionRef = _reader(firebaseFirestoreProvider)
          .collection("category")
          .doc(quiz.categoryDocRef)
          .collection("quiz")
          .doc(quiz.quizDocRef)
          .collection("questions");

      // Don't have to define questionDocRef because quiz has the reference.
      // final questionDocRef = questionRef.doc().id;
      // await questionRef.doc(quiz.questionDocRef).update(question.toDocument());

      // await questionRef.add(question.toDocument());
      final questionWithDocRef = Question(
        id: question.id,
        categoryDocRef: quiz.categoryDocRef,
        quizDocRef: quiz.quizDocRef,
        questionDocRef: quiz.questionDocRef,
        text: question.text,
        duration: question.duration,
        optionsShuffled: question.optionsShuffled,
        options: [],
      );

      await questionRef
          .doc(quiz.questionDocRef)
          .update(questionWithDocRef.toDocument());

      await questionRef.doc(quiz.questionDocRef).update({
        "options":
            question.options.map((option) => option.toDocument()).toList(),
      });
      // update(question.toDocument()) とすると question の options は Option型で、Firestore に保存できずにエラー
      // update(questionWithDocRef.toDocument()) とすると Some requested document was not found

      // await questionRef.doc(quiz.questionDocRef).update({
      //   "options":
      //       question.options!.map((option) => option.toDocument()).toList()
      // });

      // final emptyOption = await questionRef
      //     .doc(question.questionDocRef)
      //     .collection("options")
      //     .add(Option.empty().toDocument());

      // await questionRef.doc(quiz.questionDocRef).collection("options")
      //     .add(Option.empty().toDocument());

      // await _reader(firebaseFirestoreProvider)
      //     .collection("category")
      //     .doc(quiz.categoryDocRef)
      //     .collection("quiz")
      //     .add(Question(
      //             text: question.text,
      //             duration: question.duration,
      //             optionsShuffled: false)
      //         .toDocument());
      // await questionRef.doc(questionDocRef).set(Question(
      //     id: question.id,
      //     categoryDocRef: question.categoryDocRef,
      //     quizDocRef: question.quizDocRef,
      //     questionDocRef: questionDocRef,
      //     text: question.text,
      //     duration: question.duration,
      //     optionsShuffled: question.optionsShuffled,
      //     options: question.options)
      //     .toDocument());
      return questionWithDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  //
  // @override
  // Future<Question> addWeakQuestion({required Question question}) async {
  //   final User? currentUser = _reader(firebaseAuthProvider).currentUser;
  //   try {
  //     print(question);
  //     final questionRef = _reader(firebaseFirestoreProvider)
  //         .collection("user")
  //         .doc(currentUser!.uid)
  //         .collection("weakQuestion");
  //     final questionWithDocRef = Question(
  //       id: question.id,
  //       categoryDocRef: question.categoryDocRef,
  //       quizDocRef: question.quizDocRef,
  //       questionDocRef: question.questionDocRef,
  //       text: question.text,
  //       duration: question.duration,
  //       optionsShuffled: question.optionsShuffled,
  //       options: [],
  //     );
  //     await questionRef
  //         .doc(question.questionDocRef)
  //         .set(questionWithDocRef.toDocument());
  //     await questionRef
  //         .doc(question.questionDocRef)
  //         .update(questionWithDocRef.toDocument());
  //     await questionRef.doc(question.questionDocRef).update({
  //       "options":
  //           question.options.map((option) => option.toDocument()).toList(),
  //     });
  //     return questionWithDocRef;
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  @override
  Future<List<Question>> retrieveQuestionList({required Quiz quiz}) async {
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("category")
          .doc(quiz.categoryDocRef)
          .collection("quiz")
          .doc(quiz.quizDocRef)
          .collection("questions")
          .get();
      return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  //
  // @override
  // Future<List<Question>> retrieveWeakQuestionList() async {
  //   try {
  //     final User? currentUser = _reader(firebaseAuthProvider).currentUser;
  //     final snap = await _reader(firebaseFirestoreProvider)
  //         .collection("user")
  //         .doc(currentUser!.uid)
  //         .collection("weakQuestion")
  //         .get();
  //     return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }
  //
  // @override
  // Future<void> deleteWeakQuestion({required String weakQuestionDocRef}) async {
  //   final User? currentUser = _reader(firebaseAuthProvider).currentUser;
  //   try {
  //     await _reader(firebaseFirestoreProvider)
  //         .collection('user')
  //         .doc(currentUser!.uid)
  //         .collection("weakQuestion")
  //         .doc(weakQuestionDocRef)
  //         .delete();
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }
  // @override
  // Future<List<Question>> retrieveWeakQuestionList() async {
  //   try {
  //     final weakQuestionList = await _reader(weakQuestionRepositoryProvider)
  //         .retrieveWeakQuestionList();
  //     final List<Question> questionList = [];
  //     for (int i = 0; i < weakQuestionList.length; i++) {
  //       final weakQuestion = weakQuestionList[i];
  //       final snap = await _reader(firebaseFirestoreProvider)
  //           .collection("category")
  //           .doc(weakQuestion.categoryDocRef)
  //           .collection("quiz")
  //           .doc(weakQuestion.quizDocRef)
  //           .collection("questions")
  //           .doc(weakQuestion.questionDocRef)
  //           .get();
  //       questionList.add(Question.fromDocument(snap));
  //     }
  //     return questionList;
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }
}


abstract class BaseWeakQuestionRepository {
  Future<Question> addWeakQuestion({required Question question});
  Future<List<Question>> retrieveWeakQuestionList();
  Future<void> deleteWeakQuestion({required String weakQuestionDocRef});
}

final weakQuestionRepositoryProvider =
Provider<WeakQuestionRepository>((ref) => WeakQuestionRepository(ref.read));

class WeakQuestionRepository implements BaseWeakQuestionRepository {
  final Reader _reader;
  WeakQuestionRepository(this._reader);

  @override
  Future<Question> addWeakQuestion({required Question question}) async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    try {
      print(question);
      final questionRef = _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .collection("weakQuestion");
      final questionWithDocRef = Question(
        id: question.id,
        categoryDocRef: question.categoryDocRef,
        quizDocRef: question.quizDocRef,
        questionDocRef: question.questionDocRef,
        text: question.text,
        duration: question.duration,
        optionsShuffled: question.optionsShuffled,
        options: [],
      );
      await questionRef
          .doc(question.questionDocRef)
          .set(questionWithDocRef.toDocument());
      await questionRef
          .doc(question.questionDocRef)
          .update(questionWithDocRef.toDocument());
      await questionRef.doc(question.questionDocRef).update({
        "options":
        question.options.map((option) => option.toDocument()).toList(),
      });
      return questionWithDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Question>> retrieveWeakQuestionList() async {
    try {
      final User? currentUser = _reader(firebaseAuthProvider).currentUser;
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .collection("weakQuestion")
          .get();
      return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteWeakQuestion({required String weakQuestionDocRef}) async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    try {
      await _reader(firebaseFirestoreProvider)
          .collection('user')
          .doc(currentUser!.uid)
          .collection("weakQuestion")
          .doc(weakQuestionDocRef)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
