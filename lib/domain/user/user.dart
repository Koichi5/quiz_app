import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// terminal code : flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class User implements _$User {
  const User._();
  const factory User({
    String? id,
    // required String name,
    required String email,
    required String password,
  }) = _User;

  factory User.empty() => const User(email: "", password: "");

  factory User.fromJson(json) => _$UserFromJson(json);

  factory User.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return User.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}