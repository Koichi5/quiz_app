import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';

import '../../domain/repository/auth_repository.dart';
import '../controller/auth_controller.dart';
import '../controller/validator/login_validator_provider.dart';

class LoginButton extends HookConsumerWidget {
  const LoginButton(this.email, this.password, {super.key});
  final String email;
  final String password;
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
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ref.watch(loginValidatorProvider).form.isValid
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary),
            onPressed: () async {
              if (ref.watch(loginValidatorProvider).form.isValid) {
                await authControllerProviderNotifier.signInWithEmailAndPassword(
                    email, password);
                User? user = authRepositoryProviderNotifier.getCurrentUser();
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }
              } else {
                null;
              }
            },
            child: Text(
              "ロ グ イ ン",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            )),
      ),
    );
  }
}