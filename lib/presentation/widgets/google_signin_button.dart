import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';

import '../../domain/repository/auth_repository.dart';
import '../../general/general_provider.dart';
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
                side: BorderSide(color: isDarkMode(context)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onBackground,)),
            onPressed: ([bool mounted = true]) async {
              await authControllerProviderNotifier.signInWithGoogle();
              User? user =
              authRepositoryProviderNotifier.getCurrentUser();
              if (user != null) {
                if(!mounted) return;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Googleで続ける",
                    style: TextStyle(color: isDarkMode(context)
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onBackground,),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
