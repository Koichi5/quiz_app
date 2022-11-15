import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../category/category.dart';
import '../quiz/quiz.dart';
import '../quiz_history/quiz_history.dart';

// Type of quiz.id was String, but changed to int
// Have to distinguish quiz.id and quiz id of cloud-firestore
// quiz.id related to category (ex, 1 (Science), 2 (Music), 3 (Education))
// quiz id of cloud-firestore is String used to manage quiz (ex, jidhgudihdsuUIHAU)

abstract class BaseQuizRepository {
  // Future<List<Quiz>> retrieveQuizzes({required String userId});
  Future<List<Category>> retrieveCategories();
  Future<List<Quiz>> retrieveQuizListByCategory({required int categoryId});
  Future<String> addQuiz({required String userId, required Quiz quiz});
  Future<void> updateQuiz({required String userId, required Quiz quiz});
  // Future<void> toggleIsExhibited(
  //     {required String userId, required Quiz quiz});
  Future<void> deleteQuiz({required String userId, required String quizId});
}

final quizRepositoryProvider =
    Provider<QuizRepository>((ref) => QuizRepository(ref.read));

class QuizRepository implements BaseQuizRepository {
  final Reader _read;

  QuizRepository(this._read);

  // @override
  // Future<List<Quiz>> retrieveQuizzes({required String userId}) async {
  //   try {
  //     final snap = await _read(firebaseFirestoreProvider)
  //         .collection('seller')
  //         .doc(userId)
  //         .collection('productList')
  //         .orderBy('createdAt', descending: true)
  //         .get();
  //     return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList();
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  @override
  Future<List<Category>> retrieveCategories() async {
    // List<Category> categoryList = [];
    try {
      final snap =
          await _read(firebaseFirestoreProvider).collection("category").get();
      return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Quiz>> retrieveQuizListByCategory(
      {required int categoryId}) async {
    // List<Quiz> quizList = [];
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc()
          .collection("quiz")
          .doc()
          .collection("questions")
          .get();
      return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<QuizHistory>> retrieveQuizHistory() async {
    final User? currentUser = _read(firebaseAuthProvider).currentUser;
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .collection("quizHistory")
          .get();
      return snap.docs.map((doc) => QuizHistory.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> addQuiz({required String userId, required Quiz quiz}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          .add(quiz.toDocument());
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .set({"id": userId});
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // Future addField({required String userId, required Product product}) async {
  //   try {
  //     final id = await _read(firebaseFirestoreProvider).collection("seller").add({"productId" : userId});
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  @override
  Future<void> updateQuiz({required String userId, required Quiz quiz}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          // Type of quiz.id was String, but changed to int
          // Have to distinguish quiz.id and quiz id of cloud-firestore
          // quiz.id related to category (ex, 1 (Science), 2 (Music), 3 (Education))
          // quiz id of cloud-firestore is String used to manage quiz (ex, jidhgudihdsuUIHAU)
          .doc(quiz.id.toString())
          // .doc(quiz.id)
          .update(quiz.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // @override
  // Future<void> toggleIsExhibited(
  //     {required String userId, required Product product}) async {
  //   try {
  //     await _read(firebaseFirestoreProvider)
  //         .collection('seller')
  //         .doc(userId)
  //         .collection('productList')
  //         .doc(product.id)
  //         .update(product.toDocument());
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  @override
  Future<void> deleteQuiz(
      {required String userId, required String quizId}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          .doc(quizId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
