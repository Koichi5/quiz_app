import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/quiz/quiz.dart';
import 'package:quiz_app/domain/repository/quiz_repository.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';

import '../../domain/category/category.dart';

final quizExceptionProvider = StateProvider<CustomException?>((_) => null);

final quizControllerProvider = StateNotifierProvider.family
    .autoDispose<QuizController, AsyncValue<List<Quiz>>, Category>(
        (ref, category) {
  final user = ref.watch(authControllerProvider);
  return QuizController(ref.read, user?.uid, category);
});

class QuizController extends StateNotifier<AsyncValue<List<Quiz>>> {
  final Reader _reader;
  final String? _userId;
  final Category category;

  QuizController(this._reader, this._userId, this.category)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveQuiz(category: category);
    }
  }

  Future<List<Quiz>> retrieveQuiz({required Category category}) async {
    try {
      final quiz = await _reader(quizRepositoryProvider)
          .retrieveQuiz(category: category);
      if (mounted) {
        state = AsyncValue.data(quiz);
      }
      return quiz;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<Quiz> addQuiz({
    String? id,
    required String title,
    required String description,
    required bool questionsShuffled,
    String? imagePath,
    required int categoryId,
    required Category category,
  }) async {
    final quiz = Quiz(
        id: id,
        title: title,
        description: description,
        questionsShuffled: questionsShuffled,
        // category 同様 Googleロゴで代用
        imagePath:
            "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
        categoryId: categoryId,
        questions: []);
    final quizWithDocRef = await _reader(quizRepositoryProvider)
        .addQuiz(category: category, quiz: quiz);
    state.whenData((quizList) =>
        state = AsyncValue.data(quizList..add(quiz.copyWith(id: quizWithDocRef.quizDocRef))));
    return quiz;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/domain/option/option.dart';
// import 'package:quiz_app/domain/question/question.dart';
// import 'package:quiz_app/domain/quiz/quiz.dart';
// import 'package:quiz_app/domain/repository/quiz_repository.dart';
// import 'package:quiz_app/general/custom_exception.dart';
// import 'package:quiz_app/general/general_provider.dart';
// import 'package:quiz_app/presentation/controller/auth_controller.dart';
//
// import '../../domain/category/category.dart';
//
// final quizExceptionProvider = StateProvider<CustomException?>((_) => null);
//
// final quizControllerProvider =
//     StateNotifierProvider<QuizController, AsyncValue<List<Category>>>((ref) {
//   final user = ref.watch(authControllerProvider);
//   return QuizController(ref.read, user?.uid);
// });
//
// class QuizController extends StateNotifier<AsyncValue<List<Category>>>{
//   final Reader _reader;
//   final String? _userId;
//   QuizController(this._reader, this._userId)
//       : super(const AsyncValue.loading()) {
//     if (_userId != null) {
//       retrieveCategoryList();
//     }
//   }
//
//   Future<void> retrieveCategoryList() async {
//     try {
//       final categoryList =
//           await _reader(quizRepositoryProvider).retrieveCategoryList();
//       if (mounted) {
//         state = AsyncValue.data(categoryList);
//       }
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   Future<void> retrieveQuiz({required Category category}) async {
//     try {
//       final quiz = await _reader(quizRepositoryProvider)
//           .retrieveQuiz(category: category);
//       if (mounted) {
//         state = AsyncValue.data(quiz);
//       }
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   Future<void> retrieveQuestionList({required Quiz quiz}) async {
//     try {
//       final questionList = await _reader(quizRepositoryProvider)
//           .retrieveQuestionList(quiz: quiz);
//       if (mounted) {
//         state = AsyncValue.data(questionList);
//       }
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   Future<void> retrieveOptionList({required Question question}) async {
//     try {
//       final optionList = await _reader(quizRepositoryProvider)
//           .retrieveOptionList(question: question);
//       if (mounted) {
//         state = AsyncValue.data(optionList);
//       }
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   // finder_seller では id による管理で、documentId を id としていた
//   // repository の addProduct は返り値に String id を持っていたが、今回は持たせていない
//   // できるかどうか不透明　できなければ id が原因
//   Future<void> addCategory(
//       {required int id,
//       required String name, String? imagePath}) async {
//     final category = Category(id: id, name: name, imagePath: imagePath!);
//     state.whenData((categoryList) => state = AsyncValue.data(categoryList
//       ..add(category.copyWith(categoryDocRef: category.categoryDocRef))));
//   }
//
//   Future<void> addQuiz(
//       {required int id,
//       required String title,
//       required String description,
//       required bool questionsShuffled,
//       required String imagePath,
//       required int categoryId}) async {
//     final quiz = Quiz(
//         id: id,
//         title: title,
//         description: description,
//         questionsShuffled: questionsShuffled,
//         imagePath: imagePath,
//         categoryId: categoryId,
//         questions: []);
//     state.whenData((quizList) => state = AsyncValue.data(
//         quizList..add(quiz.copyWith(quizDocRef: quiz.quizDocRef))));
//   }
//
//   Future<void> addQuestion({
//     required String id,
//     required String text,
//     required int duration,
//     required bool optionsShuffled,
//   }) async {
//     final question = Question(
//         id: id,
//         text: text,
//         duration: duration,
//         optionsShuffled: optionsShuffled,
//         options: []);
//     state.whenData((questionList) => state = AsyncValue.data(questionList
//       ..add(question.copyWith(questionDocRef: question.questionDocRef))));
//   }
//
//   Future<void> addOption({
//     required String id,
//     required String text,
//     required bool isCorrect,
//   }) async {
//     final option = Option(id: id, text: text, isCorrect: isCorrect);
//     state.whenData((optionList) => state = AsyncValue.data(
//         optionList..add(option.copyWith(optionDocRef: option.optionDocRef))));
//   }
// }
