import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../category/category.dart';
import '../question/question.dart';
import '../quiz/quiz.dart';

abstract class BaseQuizRepository {
  Future<Quiz> addQuiz({required Category category, required Quiz quiz});
  Future<List<Quiz>> retrieveQuiz({required Category category});
}

final quizRepositoryProvider =
    Provider<QuizRepository>((ref) => QuizRepository(ref.read));

class QuizRepository implements BaseQuizRepository {
  final Reader _read;

  QuizRepository(this._read);

  @override
  Future<Quiz> addQuiz({required Category category, required Quiz quiz}) async {
    try {
      // final categoryRef = _read(firebaseFirestoreProvider)
      //     .collection("category")
      //     .doc(category.categoryDocRef);

      final quizRef = _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(category.categoryDocRef)
          .collection("quiz");

      // final quizDocRef = quizRef.doc().id;
      // ここが null
      // print("category.categoryDocRef : ${category.categoryDocRef}");
      // print("category.quizDocRef : ${category.quizDocRef}");
      // print("quizRef : $quizRef");

      //quiz を update
      final emptyQuestion = await quizRef
          .doc(category.quizDocRef)
          .collection("questions")
          .add(Question.empty().toDocument());

      final quizWithDocRef = Quiz(
        id: quiz.id,
        categoryDocRef: category.categoryDocRef,
        quizDocRef: category.quizDocRef,
        questionDocRef: emptyQuestion.id,
        title: quiz.title,
        description: quiz.description,
        questionsShuffled: quiz.questionsShuffled,
        imagePath: quiz.imagePath,
        categoryId: category.categoryId,
      );

      await quizRef.doc(category.quizDocRef).update(quizWithDocRef.toDocument());
      // await quizRef.doc(category.quizDocRef).set(quizWithDocRef.toDocument());

      // await categoryRef.set(Quiz(
      //   id: quiz.id,
      //   categoryDocRef: category.categoryDocRef,
      //   quizDocRef: category.quizDocRef,
      //   title: quiz.title,
      //   description: quiz.description,
      //   questionsShuffled: quiz.questionsShuffled,
      //   imagePath: quiz.imagePath,
      //   categoryId: category.categoryId,
      //   // questions: quiz.questions
      // ).toDocument());
      return quizWithDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Quiz>> retrieveQuiz({required Category category}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("category")
          .doc(category.categoryDocRef)
          .collection("quiz")
          .get();
      return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/domain/option/option.dart';
//
// import '../../general/custom_exception.dart';
// import '../../general/general_provider.dart';
// import '../category/category.dart';
// import '../question/question.dart';
// import '../quiz/quiz.dart';
// import '../quiz_history/quiz_history.dart';
//
// // Type of quiz.id was String, but changed to int
// // Have to distinguish quiz.id and quiz id of cloud-firestore
// // quiz.id related to category (ex, 1 (Science), 2 (Music), 3 (Education))
// // quiz id of cloud-firestore is String used to manage quiz (ex, jidhgudihdsuUIHAU)
//
// abstract class BaseQuizRepository {
//   // Future<List<Quiz>> retrieveQuizzes({required String userId});
//   Future<String> addCategory({required Category category});
//   Future<String> addQuiz({required Category category, required Quiz quiz});
//   Future<String> addQuestion({required Quiz quiz, required Question question});
//   Future<String> addOption(
//       {required Question question, required Option option});
//   Future<String> addQuizHistory(
//       {required User user, required QuizHistory quizHistory});
//   Future<List<Category>> retrieveCategoryList();
//   Future<List<Category>> retrieveCategoryById({required String quizCategoryDocRef});
//   Future<List<Quiz>> retrieveQuiz({required Category category});
//   Future<List<Question>> retrieveQuestionList({required Quiz quiz});
//   Future<List<Option>> retrieveOptionList({required Question question});
//   Future<List<QuizHistory>> retrieveQuizHistory();
//   Future<List<Quiz>> retrieveQuizListByCategory({required int categoryId});
//   Future<String> addFavoriteQuiz({required String userId, required Quiz quiz});
//   Future<void> updateQuiz({required String userId, required Quiz quiz});
//   Future<void> deleteQuiz({required String userId, required String quizId});
// }
//
// final quizRepositoryProvider =
//     Provider<QuizRepository>((ref) => QuizRepository(ref.read));
//
// class QuizRepository implements BaseQuizRepository {
//   final Reader _read;
//
//   QuizRepository(this._read);
//
//   // @override
//   // Future<List<Quiz>> retrieveQuizzes({required String userId}) async {
//   //   try {
//   //     final snap = await _read(firebaseFirestoreProvider)
//   //         .collection('seller')
//   //         .doc(userId)
//   //         .collection('productList')
//   //         .orderBy('createdAt', descending: true)
//   //         .get();
//   //     return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList();
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }
//
//   // Use set method in order to add categoryDocRef that enable to refer category
//   @override
//   Future<String> addCategory({required Category category}) async {
//     try {
//       final categoryRef =
//           _read(firebaseFirestoreProvider).collection("category");
//       final categoryDocRef = categoryRef.doc().id;
//       await categoryRef.doc(categoryDocRef).set(Category(
//             categoryId: category.categoryId,
//             categoryDocRef: categoryDocRef,
//             name: category.name,
//             imagePath: category.imagePath,
//           ).toDocument());
//       return categoryDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<String> addQuiz(
//       {required Category category, required Quiz quiz}) async {
//     try {
//       final quizRef = _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(category.categoryDocRef)
//           .collection("quiz");
//       final quizDocRef = quizRef.doc().id;
//       // _read(firebaseFirestoreProvider)
//       // .collection("category")
//       // .doc(category.categoryDocRef)
//       // .collection("quiz")
//       // .doc()
//       // .id;
//       // await _read(firebaseFirestoreProvider)
//       //     .collection("category")
//       //     .doc(category.categoryDocRef)
//       //     .collection("quiz")
//       //     .add(quiz.toDocument());
//       await quizRef.add(quiz.toDocument());
//       await quizRef.doc(quizDocRef).set(Quiz(
//             id: quiz.id,
//             categoryDocRef: quiz.categoryDocRef,
//             quizDocRef: quizDocRef,
//             title: quiz.title,
//             description: quiz.description,
//             questionsShuffled: quiz.questionsShuffled,
//             imagePath: quiz.imagePath,
//             categoryId: category.categoryId,
//             // questions: quiz.questions
//           ).toDocument());
//       return quizDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<String> addQuestion(
//       {required Quiz quiz, required Question question}) async {
//     try {
//       final questionRef = _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(quiz.categoryDocRef)
//           .collection("quiz")
//           .doc(quiz.quizDocRef)
//           .collection("questions");
//       final questionDocRef = questionRef.doc().id;
//       // await _read(firebaseFirestoreProvider)
//       //     .collection("category")
//       //     .doc(quiz.categoryDocRef)
//       //     .collection("quiz")
//       //     .doc(quiz.quizDocRef)
//       //     .collection("questions")
//       //     .add(question.toDocument());
//       await questionRef.add(question.toDocument());
//       await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(quiz.categoryDocRef)
//           .collection("quiz")
//           .add(Question(
//                   text: question.text,
//                   duration: question.duration,
//                   optionsShuffled: false)
//               .toDocument());
//       await questionRef.doc(questionDocRef).set(Question(
//               id: question.id,
//               categoryDocRef: question.categoryDocRef,
//               quizDocRef: question.quizDocRef,
//               questionDocRef: questionDocRef,
//               text: question.text,
//               duration: question.duration,
//               optionsShuffled: question.optionsShuffled,
//               options: question.options)
//           .toDocument());
//       return questionDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<String> addOption(
//       {required Question question, required Option option}) async {
//     try {
//       final optionRef = _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(question.categoryDocRef)
//           .collection("quiz")
//           .doc(question.quizDocRef)
//           .collection("questions")
//           .doc(question.questionDocRef)
//           .collection("options");
//       final optionDocRef = optionRef.doc().id;
//       await optionRef.add(option.toDocument());
//       await optionRef.doc(optionDocRef).set(Option(
//             id: option.id,
//             categoryDocRef: option.categoryDocRef,
//             quizDocRef: option.quizDocRef,
//             questionDocRef: option.questionDocRef,
//             optionDocRef: option.optionDocRef,
//             text: option.text,
//             isCorrect: option.isCorrect,
//           ).toDocument());
//       return optionDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<String> addQuizHistory(
//       {required User user, required QuizHistory quizHistory}) async {
//     try {
//       final quizHistoryRef = _read(firebaseFirestoreProvider)
//           .collection("user")
//           .doc(user.uid)
//           .collection("quizHistory");
//       final quizHistoryDocRef = quizHistoryRef.doc().id;
//       await quizHistoryRef.add(quizHistory.toDocument());
//       await quizHistoryRef.doc(quizHistoryDocRef).set(QuizHistory(
//             id: quizHistory.id,
//             quizDocRef: quizHistory.quizDocRef,
//             categoryDocRef: quizHistory.categoryDocRef,
//             quizTitle: quizHistory.quizTitle,
//             score: quizHistory.score,
//             timeTaken: quizHistory.timeTaken,
//             quizDate: quizHistory.quizDate,
//             status: quizHistory.status,
//           ).toDocument());
//       return quizHistoryDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<Category>> retrieveCategoryList() async {
//     try {
//       final snap =
//           await _read(firebaseFirestoreProvider).collection("category").get();
//       return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<Category>> retrieveCategoryById({required String quizCategoryDocRef}) async {
//     try {
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(quizCategoryDocRef)
//           .collection("quiz")
//           .get();
//       return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<Quiz>> retrieveQuiz({required Category category}) async {
//     try {
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(category.categoryDocRef)
//           .collection("quiz")
//           .get();
//       return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<Question>> retrieveQuestionList({required Quiz quiz}) async {
//     try {
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(quiz.categoryDocRef)
//           .collection("quiz")
//           .doc(quiz.quizDocRef)
//           .collection("questions")
//           .get();
//       return snap.docs.map((doc) => Question.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<Option>> retrieveOptionList({required Question question}) async {
//     try {
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(question.categoryDocRef)
//           .collection("quiz")
//           .doc(question.quizDocRef)
//           .collection("questions")
//           .doc(question.questionDocRef)
//           .collection("options")
//           .get();
//       return snap.docs.map((doc) => Option.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<QuizHistory>> retrieveQuizHistory() async {
//     final User? currentUser = _read(firebaseAuthProvider).currentUser;
//     try {
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("user")
//           .doc(currentUser!.uid)
//           .collection("quizHistory")
//           .get();
//       return snap.docs.map((doc) => QuizHistory.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   // @override
//   // Future<String> retrieveQuizDocumentId({required int categoryId}) async {
//   //   List quizDocumentIdList = [];
//   //   try {
//   //     await _read(firebaseFirestoreProvider)
//   //         .collection("category")
//   //         .doc(categoryId.toString())
//   //         .collection("quiz")
//   //         .get()
//   //         .then((QuerySnapshot querySnapshot) => {
//   //               querySnapshot.docs.forEach(
//   //                 (doc) {
//   //                   quizDocumentIdList.add(doc.id);
//   //                 },
//   //               )
//   //             });
//   //     return quizDocumentIdList.first.toString();
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }
//
//   // @override
//   // Future<List<Question>> retrieveQuestionList({required int categoryId}) async {
//   //   List<Question> questionList = [];
//   //   final String quizDocumentId = await retrieveQuizDocumentId(categoryId: categoryId);
//   //   try {
//   //     await _read(firebaseFirestoreProvider).collection("category").doc(categoryId.toString()).collection("quiz").doc(quizDocumentId).collection("question")
//   //   }
//   // }
//
//   //このメソッドで quiz のリストを取得
//   // quiz は単一のオブジェクトで、question collection と description, id, imagePath, questionsShuffled, title を持つ
//   @override
//   Future<Quiz> retrieveQuizByCategory({required Category category}) async {
//     try {
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(category.id.toString())
//           .collection("quiz")
//           .get();
//       return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList().first;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   // @override
//   // Future<List<Question>> retrieveQuestionByQuiz({required Quiz quiz}) async {
//   //   try {
//   //     final
//   //   }
//   // }
//
//   @override
//   Future<List<Quiz>> retrieveQuizListByCategory(
//       {required int categoryId}) async {
//     // List<Quiz> quizList = [];
//     try {
//       final docRef = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(categoryId.toString())
//           .collection("quiz")
//           .get();
//       print(docRef);
//       final snap = await _read(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(categoryId.toString())
//           .collection("quiz")
//           .doc()
//           .collection("questions")
//           .get();
//       return snap.docs.map((doc) => Quiz.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<String> addFavoriteQuiz(
//       {required String userId, required Quiz quiz}) async {
//     try {
//       final docRef = await _read(firebaseFirestoreProvider)
//           .collection('seller')
//           .doc(userId)
//           .collection('productList')
//           .add(quiz.toDocument());
//       await _read(firebaseFirestoreProvider)
//           .collection('seller')
//           .doc(userId)
//           .set({"id": userId});
//       return docRef.id;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   // Future addField({required String userId, required Product product}) async {
//   //   try {
//   //     final id = await _read(firebaseFirestoreProvider).collection("seller").add({"productId" : userId});
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }
//
//   @override
//   Future<void> updateQuiz({required String userId, required Quiz quiz}) async {
//     try {
//       await _read(firebaseFirestoreProvider)
//           .collection('seller')
//           .doc(userId)
//           .collection('productList')
//           // Type of quiz.id was String, but changed to int
//           // Have to distinguish quiz.id and quiz id of cloud-firestore
//           // quiz.id related to category (ex, 1 (Science), 2 (Music), 3 (Education))
//           // quiz id of cloud-firestore is String used to manage quiz (ex, jidhgudihdsuUIHAU)
//           .doc(quiz.id.toString())
//           // .doc(quiz.id)
//           .update(quiz.toDocument());
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   // @override
//   // Future<void> toggleIsExhibited(
//   //     {required String userId, required Product product}) async {
//   //   try {
//   //     await _read(firebaseFirestoreProvider)
//   //         .collection('seller')
//   //         .doc(userId)
//   //         .collection('productList')
//   //         .doc(product.id)
//   //         .update(product.toDocument());
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }
//
//   @override
//   Future<void> deleteQuiz(
//       {required String userId, required String quizId}) async {
//     try {
//       await _read(firebaseFirestoreProvider)
//           .collection('seller')
//           .doc(userId)
//           .collection('productList')
//           .doc(quizId)
//           .delete();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
// }
