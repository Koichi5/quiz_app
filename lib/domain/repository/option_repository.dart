// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:quiz_app/domain/option/option.dart';
// import 'package:quiz_app/domain/question/question.dart';
//
// import '../../general/custom_exception.dart';
// import '../../general/general_provider.dart';
//
// abstract class BaseOptionRepository {
//   Future<String> addOption({required Question question, required Option option});
//   Future<List<Option>> retrieveOptionList({required Question question});
// }
//
// final optionRepositoryProvider = Provider<OptionRepository>((ref) => OptionRepository(ref.read));
//
// class OptionRepository implements BaseOptionRepository {
//   final Reader _reader;
//
//   OptionRepository(this._reader);
//
//   @override
//   Future<String> addOption(
//       {required Question question, required Option option}) async {
//     try {
//       final optionRef = _reader(firebaseFirestoreProvider)
//           .collection("category")
//           .doc(question.categoryDocRef)
//           .collection("quiz")
//           .doc(question.quizDocRef)
//           .collection("questions")
//           .doc(question.questionDocRef)
//           .collection("options");
//       final optionDocRef = optionRef.doc().id;
//       // await optionRef.add(option.toDocument());
//       await optionRef.doc(optionDocRef).update(option.toDocument());
//       await optionRef.doc(optionDocRef).set(Option(
//         id: option.id,
//         // categoryDocRef: option.categoryDocRef,
//         // quizDocRef: option.quizDocRef,
//         // questionDocRef: option.questionDocRef,
//         // optionDocRef: option.optionDocRef,
//         text: option.text,
//         isCorrect: option.isCorrect,
//       ).toDocument());
//       return optionDocRef;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
//
//   @override
//   Future<List<Option>> retrieveOptionList({required Question question}) async {
//     try {
//       final snap = await _reader(firebaseFirestoreProvider)
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
// }