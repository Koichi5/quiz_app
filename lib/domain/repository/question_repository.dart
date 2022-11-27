import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/option/option.dart';
import 'package:quiz_app/domain/question/question.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../quiz/quiz.dart';

abstract class BaseQuestionRepository {
  Future<Question> addQuestion({required Quiz quiz, required Question question});
  Future<List<Question>> retrieveQuestionList({required Quiz quiz});
}

final questionRepositoryProvider = Provider<QuestionRepository> ((ref) => QuestionRepository(ref.read));

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

      // await questionRef.add(question.toDocument());

      await questionRef.doc(quiz.questionDocRef).update(question.toDocument());

      final emptyOption = await questionRef.doc(question.questionDocRef).collection("options").add(Option.empty().toDocument());

      final questionWithDocRef = Question(
        id: question.id,
        categoryDocRef: quiz.categoryDocRef,
        quizDocRef: quiz.quizDocRef,
        questionDocRef: quiz.questionDocRef,
        optionDocRef: emptyOption.id,
        text: question.text,
        duration: question.duration,
        optionsShuffled: question.optionsShuffled,
        options: [],
      );

      await questionRef.doc(quiz.questionDocRef).collection("options")
          .add(Option.empty().toDocument());

      await _reader(firebaseFirestoreProvider)
          .collection("category")
          .doc(quiz.categoryDocRef)
          .collection("quiz")
          .add(Question(
          text: question.text,
          duration: question.duration,
          optionsShuffled: false)
          .toDocument());
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
}