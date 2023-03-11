import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';

import '../../domain/category/category.dart';
import '../../domain/repository/category_repository.dart';

final categoryExceptionProvider = StateProvider<CustomException?>((_) => null);

final categoryQuestionCountProvider = StateProvider((ref) => 0);

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, AsyncValue<List<Category>>>(
        (ref) {
  final user = ref.watch(authControllerProvider);
  return CategoryController(ref.read, user?.uid);
});

class CategoryController extends StateNotifier<AsyncValue<List<Category>>> {
  final Reader _reader;
  final String? _userId;
  CategoryController(this._reader, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveCategoryList();
    }
  }

  Future<void> retrieveCategoryList() async {
    try {
      final categoryList =
          await _reader(categoryRepositoryProvider).retrieveCategoryList();
      if (mounted) {
        state = AsyncValue.data(categoryList);
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<Category> retrieveCategoryById(
      {required String quizCategoryDocRef}) async {
    try {
      final category = await _reader(categoryRepositoryProvider)
          .retrieveCategoryById(quizCategoryDocRef: quizCategoryDocRef);
      return category;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<Category> addCategory(
      {String? id,
      required int categoryId,
      required String name,
      required String description,
      required DateTime createdAt,
      String? imagePath}) async {
    final category = Category(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      categoryQuestionCount: 0,
      createdAt: createdAt,
      imagePath:
          "assets/images/category_images/category_image1.png",
    );
    final categoryWithDocRef = await _reader(categoryRepositoryProvider)
        .addCategory(category: category);
    state.whenData((categoryList) => state = AsyncValue.data(categoryList
      ..add(category.copyWith(id: categoryWithDocRef.categoryDocRef))));
    return categoryWithDocRef;
  }

  Future<void> editCategoryQuestionCount(
      {required int categoryQuestionCount,
      required String categoryDocRef}) async {
    await _reader(categoryRepositoryProvider).editCategoryQuestionCount(
        categoryQuestionCount: categoryQuestionCount,
        categoryDocRef: categoryDocRef);
  }
}
