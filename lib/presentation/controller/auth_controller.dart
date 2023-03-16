import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repository/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read)..appStarted());

class AuthController extends StateNotifier<User?> {
  final Reader _reader;
  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._reader) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _reader(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void appStarted() async {
    final user = _reader(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _reader(authRepositoryProvider)
        .createUserWithEmailAndPassword(email, password);
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    User? user = await _reader(authRepositoryProvider)
        .signInWithEmailAndPassword(email, password);
    return user;
  }

  Future<User?> signInWithGoogle() async {
    User? user = await _reader(authRepositoryProvider).signInWithGoogle();
    return user;
  }

  // Apple sign in
  Future<User?> signInWithApple() async {
    User? user =
        await _reader(authRepositoryProvider).signInWithApple();
    return user;
  }

  Future<void> signOut() async {
    await _reader(authRepositoryProvider).signOut();
  }
}
