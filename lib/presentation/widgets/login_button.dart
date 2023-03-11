import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';

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
            onPressed: ([bool mounted = true]) async {
              if (ref.watch(loginValidatorProvider).form.isValid) {
                User? user = await authControllerProviderNotifier
                    .signInWithEmailAndPassword(email, password);
                if (user != null) {
                  if (!mounted) return;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                } else {
                  if (!mounted) return;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                                child: Text(
                              "メールアドレスまたはパスワードが\n 正しくありません",
                              textAlign: TextAlign.center,
                            )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("戻る"))
                        ]);
                      });
                }
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
