import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../general/custom_exception.dart';
import '../../general/general_provider.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<User?> signInWithGoogle();
  Future<UserCredential> signInWithApple();
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
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final result =
          await _reader(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
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
      throw CustomException(message: e.message);
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
        throw CustomException(message: e.message);
      }
    }
    return user;
  }

  @override
  Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
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
