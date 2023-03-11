import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';

import '../../domain/repository/auth_repository.dart';
import '../../general/general_provider.dart';
import '../controller/auth_controller.dart';

class AppleSignInButton extends HookConsumerWidget {
  const AppleSignInButton({Key? key}) : super(key: key);

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
              side: BorderSide(
                color: isDarkMode(context)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onPressed: () async {
              await authControllerProviderNotifier.signInWithApple();
              User? user = authRepositoryProviderNotifier.getCurrentUser();
              if (user != null) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isDarkMode(context)
                      ? "assets/images/apple_logo_dark.png"
                      : "assets/images/apple_logo.png",
                  width: 20,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Appleで続ける",
                    style: TextStyle(
                      color: isDarkMode(context)
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
