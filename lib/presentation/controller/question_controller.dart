import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/option/option.dart';
import 'package:quiz_app/domain/quiz/quiz.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';
import 'package:quiz_app/presentation/controller/option_text_controller.dart';

import '../../domain/question/question.dart';
import '../../domain/repository/question_repository.dart';

final questionExceptionProvider = StateProvider<CustomException?>((_) => null);

final questionControllerProvider = StateNotifierProvider.family
    .autoDispose<QuestionController, AsyncValue<List<Question>>, Quiz>(
        (ref, quiz) {
  final user = ref.watch(authControllerProvider);
  return QuestionController(ref.read, user?.uid, quiz);
});

class QuestionController extends StateNotifier<AsyncValue<List<Question>>> {
  final Reader _reader;
  final String? _userId;
  final Quiz quiz;

  QuestionController(this._reader, this._userId, this.quiz)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      if (quiz != Quiz.empty()) {
        retrieveQuestionList(quiz: quiz);
      } else {
        retrieveWeakQuestionList();
      }
    }
  }

  Future<void> retrieveQuestionList({required Quiz quiz}) async {
    try {
        final questionList = await _reader(questionRepositoryProvider)
            .retrieveQuestionList(quiz: quiz);
        if (mounted) {
          state = AsyncValue.data(questionList);
        }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<void> retrieveWeakQuestionList() async {
    try {
      final weakQuestionList = await _reader(questionRepositoryProvider)
          .retrieveWeakQuestionList();
      if (mounted) {
        state = AsyncValue.data(weakQuestionList);
      }
    } on FirebaseException catch (e){
      throw CustomException(message: e.message);
    }
  }

  // Future<List<Question>> retrieveWeakQuestionList(
  //     {required List<WeakQuestion> weakQuestionList}) async {
  //   try {
  //     final retrievedWeakQuestionList =
  //         await _reader(questionRepositoryProvider)
  //             .retrieveWeakQuestionList(weakQuestionList: weakQuestionList);
  //     if (mounted) {
  //       state = AsyncValue.data(retrievedWeakQuestionList);
  //     }
  //     return retrievedWeakQuestionList;
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  Future<Question> addQuestion({
    String? id,
    required String text,
    required String duration,
    required bool optionsShuffled,
    required Quiz quiz,
  }) async {
    final question = Question(
      id: id,
      text: text,
      duration: int.parse(duration),
      optionsShuffled: optionsShuffled,
      options: [
        Option(
            text: _reader(firstOptionTextControllerProvider).text,
            isCorrect: _reader(firstOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(secondOptionTextControllerProvider).text,
            isCorrect: _reader(secondOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(thirdOptionTextControllerProvider).text,
            isCorrect: _reader(thirdOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(fourthOptionTextControllerProvider).text,
            isCorrect: _reader(fourthOptionIsCorrectProvider),
            isSelected: false),
      ],
    );
    final questionWithDocRef = await _reader(questionRepositoryProvider)
        .addQuestion(quiz: quiz, question: question);
    state.whenData((questionList) => state = AsyncValue.data(
        questionList..add(question.copyWith(id: questionWithDocRef.id))));
    return question;
  }

  Future<Question> addWeakQuestion({
    String? id,
    required String text,
    required String duration,
    required bool optionsShuffled,
    required Quiz quiz,
  }) async {
    final question = Question(
      id: id,
      text: text,
      duration: int.parse(duration),
      optionsShuffled: optionsShuffled,
      options: [
        Option(
            text: _reader(firstOptionTextControllerProvider).text,
            isCorrect: _reader(firstOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(secondOptionTextControllerProvider).text,
            isCorrect: _reader(secondOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(thirdOptionTextControllerProvider).text,
            isCorrect: _reader(thirdOptionIsCorrectProvider),
            isSelected: false),
        Option(
            text: _reader(fourthOptionTextControllerProvider).text,
            isCorrect: _reader(fourthOptionIsCorrectProvider),
            isSelected: false),
      ],
    );
    final questionWithDocRef = await _reader(questionRepositoryProvider)
        .addQuestion(quiz: quiz, question: question);
    state.whenData((questionList) => state = AsyncValue.data(
        questionList..add(question.copyWith(id: questionWithDocRef.id))));
    return question;
  }
}
