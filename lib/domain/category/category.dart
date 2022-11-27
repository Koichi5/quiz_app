import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz.dart';

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
    String? imagePath,
  }) = _Category;

  factory Category.empty() => const Category(categoryId: 0, name: "",);

  factory Category.fromJson(json) => _$CategoryFromJson(json);

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Category.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}