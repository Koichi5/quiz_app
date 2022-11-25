import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:quiz_app/domain/repository/quiz_repository.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';

import '../../domain/category/category.dart';
import '../../domain/quiz/quiz.dart';

final categoryExceptionProvider = StateProvider<CustomException?>((_) => null);

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
          await _reader(quizRepositoryProvider).retrieveCategoryList();
      if (mounted) {
        state = AsyncValue.data(categoryList);
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<List<Category>> retrieveCategoryById({required String quizCategoryDocRef}) async {
    try {
      final category = await _reader(quizRepositoryProvider).retrieveCategoryById(quizCategoryDocRef: quizCategoryDocRef);
      if (mounted) {
        state = AsyncValue.data(category);
      }
      return category;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // finder_seller では id による管理で、documentId を id としていた
  // repository の addProduct は返り値に String id を持っていたが、今回は持たせていない
  // できるかどうか不透明　できなければ id が原因
  Future<Category> addCategory(
      {String? id,
      required int categoryId,
      required String name,
      String? imagePath}) async {
    final category = Category(
      id: id,
      categoryId: categoryId,
      name: name,
      // google のロゴで代用
      imagePath: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
    );
    final categoryDocRef =
        await _reader(quizRepositoryProvider).addCategory(category: category);
    state.whenData((categoryList) => state = AsyncValue.data(
        categoryList..add(category.copyWith(id: categoryDocRef))));
    return category;
  }
}
