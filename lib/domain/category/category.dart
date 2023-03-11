import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category implements _$Category {
  const Category._();

  const factory Category({
    String? id,
    required int categoryId,
    String? categoryDocRef,
    String? quizDocRef,
    required String name,
    required String description,
    required int categoryQuestionCount,
    required String imagePath,
    required DateTime createdAt,
  }) = _Category;

  factory Category.empty() => Category(categoryId: 0, name: "", description: "", categoryQuestionCount: 0, imagePath: "", createdAt: DateTime.now(),);

  factory Category.fromJson(json) => _$CategoryFromJson(json);

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Category.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}