import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';
import '../quiz_history/quiz_history.dart';

final userCompletedCategoryListProvider = StateProvider((ref) => []);

abstract class BaseQuizHistoryRepository {
  Future<String> addQuizHistory(
      {required User user, required QuizHistory quizHistory});
  Future<List<QuizHistory>> retrieveQuizHistoryList();
  Future<List<String>> retrieveUserCompletedCategoryNameList();
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
      // final quizHistoryQuestionList = quizHistory.questionList.forEach((question) {
      //   final questionList = question;
      //   return questionList;
      // });
      // await quizHistoryRef.add(quizHistory.toDocument());
      await quizHistoryRef.doc(quizHistoryDocRef).set(QuizHistory(
            id: quizHistory.id,
            quizDocRef: quizHistory.quizDocRef,
            categoryDocRef: quizHistory.categoryDocRef,
            quizTitle: quizHistory.quizTitle,
            score: quizHistory.score,
            questionCount: quizHistory.questionCount,
            timeTakenMinutes: quizHistory.timeTakenMinutes,
            timeTakenSeconds: quizHistory.timeTakenSeconds,
            quizDate: quizHistory.quizDate,
            status: quizHistory.status,
            takenQuestions: quizHistory.takenQuestions,
            answerIsCorrectList: quizHistory.answerIsCorrectList,
            questionList: [],
          ).toDocument());

      await quizHistoryRef.doc(quizHistoryDocRef).update({
        "questionList": quizHistory.questionList
            .map((question) => question.copyWith(options: []).toDocument())
            .toList()
        // .map((question) => question.copyWith(
        // options: []).toDocument())
        // .toList(),
        // await quizHistoryRef.doc(quizHistoryDocRef).update({
        // "questionList": quizHistory.questionList
        //     .map((question) => question.copyWith(options: []).toDocument())
        //     .toList(),
      });

      // await quizHistoryRef.doc(quizHistoryDocRef).update({
      //   "options" : quizHistory.questionList.map((question) => question.options)
      // });
      //
      // await quizHistoryRef.doc(quizHistoryDocRef).update({
      //   "questionList": {
      //     "options": '1'
      //     // quizHistory.questionList
      //     //     .map((question) => question.options.forEach((element) {
      //     //           element.copyWith().toDocument();
      //     //         }))
      //   }
      // }
      //     {
      //   "questionList": quizHistory.questionList
      //       .map((question) => question.copyWith(options: []).toDocument())
      //       .toList(),
      //   // await quizHistoryRef.doc(quizHistoryDocRef).update({
      //   // "questionList": quizHistory.questionList
      //   //     .map((question) => question.copyWith(options: []).toDocument())
      //   //     .toList(),
      // }
      // );

      // final List userCompletedCategoryList = [];

      // _reader(userCompletedCategoryListProvider.notifier).state =
      //     await retrieveUserCompletedCategoryList();
      // print(_reader(userCompletedCategoryListProvider.notifier).state);
      // if (!_reader(userCompletedCategoryListProvider)
      //     .contains(quizHistory.categoryDocRef)) {
      //   _reader(userCompletedCategoryListProvider.notifier)
      //       .state
      //       .insert(0, quizHistory.categoryDocRef);
      //   await _reader(firebaseFirestoreProvider)
      //       .collection("user")
      //       .doc(user.uid)
      //       .set({
      //     "userCompletedCategoryList":
      //         _reader(userCompletedCategoryListProvider)
      //   });
      // }
      //
      // final List currentUserCompleterCategoryList =
      //     await _reader(firebaseFirestoreProvider)
      //         .collection("user")
      //         .doc(user.uid)
      //         .get()
      //         .then((value) => value.data()!.values.toList());
      // if (!currentUserCompleterCategoryList
      //     .contains(quizHistory.categoryDocRef)) {
      //   currentUserCompleterCategoryList.add(quizHistory.categoryDocRef);
      //   await _reader(firebaseFirestoreProvider)
      //       .collection("user")
      //       .doc(user.uid)
      //       .update({"userCompletedCategory": currentUserCompleterCategoryList});
      // }
      // print(currentUserCompleterCategoryList);
      // _reader(firebaseFirestoreProvider).collection("user").doc(user.uid).set({
      //   "userCompletedCategory": [quizHistory.categoryDocRef]
      // });
      // _reader(userCompletedCategoryListProvider.notifier).state =
      //     await _reader(firebaseFirestoreProvider)
      //         .collection("user")
      //         .doc(user.uid)
      //         .get()
      //         .then((value) => value.data()!.values.toList());
      // if (!_reader(userCompletedCategoryListProvider)
      //     .contains(quizHistory.categoryDocRef)) {
      //   _reader(userCompletedCategoryListProvider.notifier)
      //       .state
      //       .add(quizHistory.categoryDocRef);
      //   // この処理を実行するとアプリが落ちる
      //   await _reader(firebaseFirestoreProvider)
      //       .collection("user")
      //       .doc(user.uid)
      //       .set({
      //     "userCompletedCategory": _reader(userCompletedCategoryListProvider)
      //   });
      // }
      return quizHistoryDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<List<String?>> retrieveUserCompletedCategoryList() async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    try {
      final snap = _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .get();
      return snap.then(
          (value) => value.data()!.values.map((e) => e.toString()).toList());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<QuizHistory>> retrieveQuizHistoryList() async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    const int quizHistoryLimitCount = 10;
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .collection("quizHistory")
          .orderBy("quizDate", descending: true)
          .limit(quizHistoryLimitCount)
          .get();
      return snap.docs.map((doc) => QuizHistory.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // Future<void> deleteQuizHistoryList() async {
  //   final User? currentUser = _reader(firebaseAuthProvider).currentUser;
  //   try{
  //     final snap = await _reader(firebaseFirestoreProvider)
  //         .collection("user")
  //         .doc(currentUser!.uid)
  //         .collection("quizHistory").doc().delete();
  //   }
  // }

  @override
  Future<List<String>> retrieveUserCompletedCategoryNameList() async {
    final User? currentUser = _reader(firebaseAuthProvider).currentUser;
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("user")
          .doc(currentUser!.uid)
          .get();
      return snap.data()!.values.map((e) => e.toString()).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
