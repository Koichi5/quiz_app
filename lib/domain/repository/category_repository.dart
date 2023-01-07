import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/general/general_provider.dart';

import '../category/category.dart';
import '../quiz/quiz.dart';

abstract class BaseCategoryRepository {
  Future<Category> addCategory({required Category category});
  Future<List<Category>> retrieveCategoryList();
  Future<Category> retrieveCategoryById(
      {required String quizCategoryDocRef});
  Future<void> editCategoryQuestionCount(
      {required int categoryQuestionCount, required String categoryDocRef});
}

final categoryRepositoryProvider =
    Provider<CategoryRepository>((ref) => CategoryRepository(ref.read));

class CategoryRepository implements BaseCategoryRepository {
  final Reader _reader;

  CategoryRepository(this._reader);

  @override
  Future<Category> addCategory({required Category category}) async {
    try {
      final categoryRef =
          _reader(firebaseFirestoreProvider).collection("category");

      final categoryDocRef = categoryRef.doc().id;

      final emptyQuiz = await categoryRef
          .doc(categoryDocRef)
          .collection("quiz")
          .add(Quiz.empty().toDocument());

      final categoryWithDocRef = Category(
        categoryId: category.categoryId,
        categoryDocRef: categoryDocRef,
        quizDocRef: emptyQuiz.id,
        name: category.name,
        description: category.description,
        categoryQuestionCount: 0,
        imagePath: category.imagePath,
        createdAt: category.createdAt,
      );

      await categoryRef
          .doc(categoryDocRef)
          .set(categoryWithDocRef.toDocument());

      return categoryWithDocRef;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Category>> retrieveCategoryList() async {
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("category")
          .orderBy("createdAt")
          .get();
      return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Category> retrieveCategoryById(
      {required String quizCategoryDocRef}) async {
    try {
      final snap = await _reader(firebaseFirestoreProvider)
          .collection("category")
          .doc(quizCategoryDocRef)
          .get();
      // return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
      return Category.fromDocument(snap);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> editCategoryQuestionCount(
      {required int categoryQuestionCount,
      required String categoryDocRef}) async {
    try {
      final categoryRef =
          _reader(firebaseFirestoreProvider).collection("category");

      await categoryRef
          .doc(categoryDocRef)
          .update({"categoryQuestionCount": categoryQuestionCount});
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
