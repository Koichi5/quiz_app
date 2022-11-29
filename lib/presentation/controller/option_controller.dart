// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/domain/quiz/quiz.dart';
// import 'package:quiz_app/domain/repository/quiz_repository.dart';
// import 'package:quiz_app/general/custom_exception.dart';
// import 'package:quiz_app/presentation/controller/auth_controller.dart';
//
// import '../../domain/option/option.dart';
// import '../../domain/question/question.dart';
// import '../../domain/repository/option_repository.dart';
//
// final optionExceptionProvider = StateProvider<CustomException?>((_) => null);
//
// final optionControllerProvider = StateNotifierProvider.family
//     .autoDispose<OptionController, AsyncValue<List<Option>>, Question>(
//         (ref, question) {
//   final user = ref.watch(authControllerProvider);
//   return OptionController(ref.read, user?.uid, question);
// });
//
// class OptionController extends StateNotifier<AsyncValue<List<Option>>> {
//   final Reader _reader;
//   final String? _userId;
//   final Question question;
//
//   OptionController(this._reader, this._userId, this.question)
//       : super(const AsyncValue.loading()) {
//     if (_userId != null) {
//       retrieveOptionList(question: question);
//     }
//   }
//
//   Future<void> retrieveOptionList({required Question question}) async {
//     try {
//       final optionList = await _reader(optionRepositoryProvider)
//           .retrieveOptionList(question: question);
//       if (mounted) {
//         state = AsyncValue.data(optionList);
//       }
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
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
