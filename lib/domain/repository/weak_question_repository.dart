// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/presentation/controller/weak_question_controller.dart';
//
// import '../../general/custom_exception.dart';
// import '../../general/general_provider.dart';
// import '../../presentation/widgets/weak_question_card.dart';
// import '../question/question.dart';
// import '../weak_question/weak_question.dart';
// import '../weak_question_list/weak_question_list.dart';
//
// abstract class BaseWeakQuestionRepository {
//   Future<String> addWeakQuestion(
//       {required String userId, required WeakQuestion weakQuestion});
//   Future deleteWeakQuestion(
//       {required String userId, required WeakQuestion weakQuestion});
//   Future<List<WeakQuestion>> retrieveWeakQuestionList();
// }
//
// final weakQuestionRepositoryProvider =
//     Provider<WeakQuestionRepository>((ref) => WeakQuestionRepository(ref.read));
//
// class WeakQuestionRepository implements BaseWeakQuestionRepository {
//   final Reader _reader;
//
//   WeakQuestionRepository(this._reader);
//
//   @override
//   Future<String> addWeakQuestion(
//       {required String userId, required WeakQuestion weakQuestion}) async {
//     try {
//       final weakQuestionRef = _reader(firebaseFirestoreProvider)
//           .collection("user")
//           .doc(userId)
//           .collection("weakQuestion");
//       final weakQuestionDocRef = weakQuestionRef.doc().id;
//       await weakQuestionRef.doc(weakQuestion.questionDocRef).set(WeakQuestion(
//             id: weakQuestion.id,
//             categoryDocRef: weakQuestion.categoryDocRef,
//             quizDocRef: weakQuestion.quizDocRef,
//             questionDocRef: weakQuestion.questionDocRef,
//             weakQuestionDocRef: weakQuestionDocRef,
//           ).toDocument());
//       return weakQuestionDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future deleteWeakQuestion(
//       {required String userId, required WeakQuestion weakQuestion}) async {
//     try {
//       await _reader(firebaseFirestoreProvider)
//           .collection("user")
//           .doc(userId)
//           .collection("weakQuestion")
//           .doc(weakQuestion.questionDocRef)
//           .delete().whenComplete(() {
//             _reader(weakQuestionScrollListViewProvider.notifier).retrieveWeakQuestionList();
//       });
//       print("deleted");
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<WeakQuestion>> retrieveWeakQuestionList() async {
//     final User? currentUser = _reader(firebaseAuthProvider).currentUser;
//     try {
//       final snap = await _reader(firebaseFirestoreProvider)
//           .collection("user")
//           .doc(currentUser!.uid)
//           .collection("weakQuestion")
//           .get();
//       return snap.docs.map((doc) => WeakQuestion.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
// }
//


//
//
//
// class WeakQuestionScrollListView extends StateNotifier<WeakQuestionList> {
//   WeakQuestionScrollListView(this._reader) : super(WeakQuestionList(weakQuestionList: [])) {
//     retrieveWeakQuestionList();
//   }
//   final Reader _reader;
//
//   Future<void> fetchList() async {
//     print("fetchList");
//     state = state.copyWith(isLoading: true, error: null);
//     try {
//       List<Question> weakQuestionList = [];
//       final newList = retrieveWeakQuestionList();
//       // await for (var data in newList) {
//       //   weakQuestionList = data;
//       // }
//       state = state.copyWith(weakQuestionList: weakQuestionList, isLoading: false, error: null);
//     } on Exception catch (error) {
//       state = state.copyWith(error: error.toString(), isLoading: false);
//     }
//   }
//
//   Stream<List<WeakQuestion>> retrieveWeakQuestionList() async* {
//     print("stream retrieveWeakQuestionList");
//     final User? currentUser = _reader(firebaseAuthProvider).currentUser;
//     try {
//       final snap = await _reader(firebaseFirestoreProvider)
//           .collection("user")
//           .doc(currentUser!.uid)
//           .collection("weakQuestion")
//           .get();
//       yield snap.docs.map((doc) => WeakQuestion.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   Future<List<Question>> retrieveStreamWeakQuestionList() async {
//     try {
//       final weakQuestionList = await _reader(weakQuestionRepositoryProvider)
//           .retrieveWeakQuestionList();
//       final List<Question> questionList = [];
//       for (int i = 0; i < weakQuestionList.length; i++) {
//         final weakQuestion = weakQuestionList[i];
//         final snap = await _reader(firebaseFirestoreProvider)
//             .collection("category")
//             .doc(weakQuestion.categoryDocRef)
//             .collection("quiz")
//             .doc(weakQuestion.quizDocRef)
//             .collection("questions")
//             .doc(weakQuestion.questionDocRef)
//             .get();
//         questionList.add(Question.fromDocument(snap));
//       }
//       return questionList;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   // Stream<List<WeakQuestion>> deleteWeakQuestion(
//   //     {required String userId, required WeakQuestion weakQuestion}) async* {
//   //   List<WeakQuestion> weakQuestionList = [];
//   //   try {
//   //     await _reader(firebaseFirestoreProvider)
//   //         .collection("user")
//   //         .doc(userId)
//   //         .collection("weakQuestion")
//   //         .doc(weakQuestion.questionDocRef)
//   //         .delete().whenComplete(() async {
//   //           weakQuestionList = await _reader(weakQuestionControllerProvider.notifier).retrieveWeakQuestionList();
//   //       // _reader(weakQuestionScrollListViewProvider.notifier).retrieveWeakQuestionList();
//   //     });
//   //     yield weakQuestionList;
//   //     print("deleted");
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }
//   //
//   // Future<List<Question>> fetchNextListByDummyRepository() async {
//   //   print('fetchNextListByDummyRepository');
//   //   try {
//   //     final weakQuestionList = retrieveWeakQuestionList();
//   //     final List<Question> questionList = [];
//   //     for (int i = 0; i < weakQuestionList.length; i++) {
//   //       final weakQuestion = weakQuestionList[i];
//   //       final snap = await _reader(firebaseFirestoreProvider)
//   //           .collection("category")
//   //           .doc(weakQuestion.categoryDocRef)
//   //           .collection("quiz")
//   //           .doc(weakQuestion.quizDocRef)
//   //           .collection("questions")
//   //           .doc(weakQuestion.questionDocRef)
//   //           .get();
//   //       questionList.add(Question.fromDocument(snap));
//   //     }
//   //     return questionList;
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }
// }
//
// final weakQuestionScrollListViewProvider = StateNotifierProvider(
//       (ref) => WeakQuestionScrollListView(ref.read),
// );