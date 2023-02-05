import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_item.freezed.dart';
part 'dictionary_item.g.dart';

@freezed
abstract class DictionaryItem implements _$DictionaryItem {
  const DictionaryItem._();

  const factory DictionaryItem({
    String? id,
    required String dictionaryWord,
    required String dictionaryDescription,
    required String dictionaryUrl,
  }) = _DictionaryItem;

  factory DictionaryItem.empty() => const DictionaryItem(
        dictionaryWord: "",
        dictionaryDescription: "",
        dictionaryUrl: "",
      );

  factory DictionaryItem.fromJson(json) => _$DictionaryItemFromJson(json);

  factory DictionaryItem.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return DictionaryItem.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
