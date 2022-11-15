import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../category/category.dart';
import '../question/question.dart';
import '../quiz/quiz.dart';
import '../quiz_history/quiz_history.dart';

// Type of quiz.id was String, but changed to int
// Have to distinguish quiz.id and quiz id of cloud-firestore
// quiz.id related to category (ex, 1 (Science), 2 (Music), 3 (Education))
// quiz id of cloud-firestore is String used to manage quiz (ex, jidhgudihdsuUIHAU)

abstract class BaseQuizRepository {
  // Future<List<Quiz>> retrieveQuizzes({required String userId});
  Future<void> addCategory({required Category category});
  Future<void> addQuiz({required Category category, required Quiz quiz});
  Future<void> addQuestion({required Quiz quiz, required Question question});
  Future<List<Category>> retrieveCategories();
  Future<List<Quiz>> retrieveQuizListByCategory({required int categoryId});
  Future<String> addFavoriteQuiz({required String userId, required Quiz quiz});
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

  // Use set method in order to add categoryDocRef that enable to refer category
  @override
  Future<void> addCategory({required Category category}) async {
    try {
      final categoryDocRef =
          _read(firebaseFirestoreProvider).collection("category").doc().id;
      await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(categoryDocRef)
          .set(Category(
            id: category.id,
            categoryDocRef: categoryDocRef,
            name: category.name,
            imagePath: category.imagePath,
          ).toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> addQuiz({required Category category, required Quiz quiz}) async {
    try {
      final quizDocRef = _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(category.categoryDocRef)
          .collection("quiz")
          .doc()
          .id;
      await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(category.categoryDocRef)
          .collection("quiz")
          .doc(quizDocRef)
          .set(Quiz(
                  id: quiz.id,
                  quizDocRef: quizDocRef,
                  categoryDocRef: quiz.categoryDocRef,
                  title: quiz.title,
                  description: quiz.description,
                  questionsShuffled: quiz.questionsShuffled,
                  imagePath: quiz.imagePath,
                  categoryId: quiz.categoryId,
                  questions: quiz.questions)
              .toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> addQuestion({required Quiz quiz, required Question question}) async {
    try {
      final quizDocRef = _read(firebaseFirestoreProvider)
          .collection("category")
          .doc()
          .collection("quiz")
          .doc()
          .id;
      await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(quiz.categoryDocRef)
          .collection("quiz")
          .doc(quizDocRef)
          .set(Quiz(
          id: quiz.id,
          categoryDocRef: quiz.categoryDocRef,
          quizDocRef: quizDocRef,
          title: quiz.title,
          description: quiz.description,
          questionsShuffled: quiz.questionsShuffled,
          imagePath: quiz.imagePath,
          categoryId: quiz.categoryId,
          questions: quiz.questions)
          .toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

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

  // @override
  // Future<String> retrieveQuizDocumentId({required int categoryId}) async {
  //   List quizDocumentIdList = [];
  //   try {
  //     await _read(firebaseFirestoreProvider)
  //         .collection("category")
  //         .doc(categoryId.toString())
  //         .collection("quiz")
  //         .get()
  //         .then((QuerySnapshot querySnapshot) => {
  //               querySnapshot.docs.forEach(
  //                 (doc) {
  //                   quizDocumentIdList.add(doc.id);
  //                 },
  //               )
  //             });
  //     return quizDocumentIdList.first.toString();
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  // @override
  // Future<List<Question>> retrieveQuestionList({required int categoryId}) async {
  //   List<Question> questionList = [];
  //   final String quizDocumentId = await retrieveQuizDocumentId(categoryId: categoryId);
  //   try {
  //     await _read(firebaseFirestoreProvider).collection("category").doc(categoryId.toString()).collection("quiz").doc(quizDocumentId).collection("question")
  //   }
  // }

  //このメソッドで quiz のリストを取得
  // quiz は単一のオブジェクトで、question collection と description, id, imagePath, questionsShuffled, title を持つ
  @override
  Future<Quiz> retrieveQuizByCategory({required Category category}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(category.id.toString())
          .collection("quiz")
          .get();
      return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList().first;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // @override
  // Future<List<Question>> retrieveQuestionByQuiz({required Quiz quiz}) async {
  //   try {
  //     final
  //   }
  // }

  @override
  Future<List<Quiz>> retrieveQuizListByCategory(
      {required int categoryId}) async {
    // List<Quiz> quizList = [];
    try {
      final docRef = await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(categoryId.toString())
          .collection("quiz")
          .get();
      print(docRef);
      final snap = await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(categoryId.toString())
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
  Future<String> addFavoriteQuiz(
      {required String userId, required Quiz quiz}) async {
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
