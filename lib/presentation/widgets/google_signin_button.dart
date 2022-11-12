import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';

import '../../domain/repository/auth_repository.dart';
import '../controller/auth_controller.dart';

class GoogleSignInButton extends HookConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerProviderNotifier =
    ref.watch(authControllerProvider.notifier);
    final authRepositoryProviderNotifier = ref.watch(authRepositoryProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black)),
            onPressed: () async {
              await authControllerProviderNotifier.signInWithGoogle();
              User? user =
              authRepositoryProviderNotifier.getCurrentUser();
              if (user != null) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google_logo.png",
                  width: 20,
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Googleで続ける",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
