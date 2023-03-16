import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/general/global_navigator.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password);
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithApple();
  User? getCurrentUser();
  Future<void> signOut();
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {
  //_read to _reader
  final Reader _reader;

  const AuthRepository(this._reader);

  @override
  Stream<User?> get authStateChanges =>
      _reader(firebaseAuthProvider).authStateChanges();

  @override
  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final result =
          await _reader(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      if (e.toString() ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        GlobalNavigator.showErrorDialog(
            "メールアドレスの形式が正しくありません", "メールアドレスの形式を直して入力してください");
      } else if (e.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        GlobalNavigator.showErrorDialog(
            "このメールアドレスは既に使用されています", "他のメールアドレスを入力してください");
      } else {
        GlobalNavigator.showErrorDialog("不明なエラーです", "時間をおいて再度お試しください");
      }
    }
    return null;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    User? user;
    try {
      user = (await _reader(firebaseAuthProvider)
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.toString() ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        GlobalNavigator.showErrorDialog(
            "このメールアドレスは登録されていません", "他のメールアドレスでお試しください");
      }
      if (e.toString() ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        GlobalNavigator.showErrorDialog(
            "メールアドレスの形式が正しくありません", "メールアドレスの形式を直して入力してください");
      }
      if (e.toString() ==
          '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
        GlobalNavigator.showErrorDialog("パスワードが異なります", "他のパスワードをお試しください");
      } else {
        GlobalNavigator.showErrorDialog("不明なエラーです", "時間をおいて再度お試しください");
      }
    }
    return user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    User? user;

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _reader(firebaseAuthProvider)
                .signInWithCredential(credential);

        //User を返す場合
        // final user = userCredential.user;
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        GlobalNavigator.showErrorDialog("Googleでのサインインに失敗しました", "再度お試しください");
        // throw CustomException(message: e.message);
      }
    }
    return user;
  }

  @override
  Future<User?> signInWithApple() async {
    User? user;
    try {
      final rawNonce = generateNonce();
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      user = userCredential.user;
      return user;
    } on FirebaseException catch (e) {
      GlobalNavigator.showErrorDialog("Appleでのサインインに失敗しました", "再度お試しください");
    }
    return null;
  }

  @override
  User? getCurrentUser() {
    try {
      final user = _reader(firebaseAuthProvider).currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await _reader(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
