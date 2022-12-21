import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';
part 'option.g.dart';

@freezed
abstract class Option implements _$Option {
  const Option._();

  const factory Option({
    String? id,
    required String text,
    required bool isCorrect,
    required bool isSelected,
  }) = _Option;

  factory Option.empty() => const Option(text: "", isCorrect: false, isSelected: false);

  factory Option.fromJson(json) => _$OptionFromJson(json);

  factory Option.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Option.fromJson(data).copyWith(id: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}