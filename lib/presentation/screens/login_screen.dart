import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/widgets/login_button.dart';

import '../controller/login_text_controller.dart';
import '../controller/validator/login_validator_provider.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailControllerProvider =
        ref.watch(loginEmailControllerStateProvider);
    final passwordControllerProvider =
        ref.watch(loginPasswordControllerStateProvider);
    final obscureText = ref.watch(loginObscureTextStateProvider);
    final obscureTextControllerNotifier =
        ref.watch(loginObscureTextStateProvider.notifier);
    final loginValidator = ref.watch(loginValidatorProvider);
    final loginValidatorNotifier = ref.watch(loginValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              child: CustomTextField(
                title: "メールアドレス",
                controller: emailControllerProvider,
                error: loginValidator.form.email.errorMessage,
                onChanged: (email) {
                  loginValidatorNotifier.setEmail(email);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              child: CustomTextField(
                  title: "パスワード",
                  controller: passwordControllerProvider,
                  obscureText: obscureText,
                  error: loginValidator.form.password.errorMessage,
                  onChanged: (password) {
                    loginValidatorNotifier.setPassword(password);
                  },
                  suffixIcon: obscureText
                      ? IconButton(
                          onPressed: () {
                            obscureTextControllerNotifier.state = false;
                          },
                          icon: const Icon(Icons.visibility_off))
                      : IconButton(
                          onPressed: () {
                            obscureTextControllerNotifier.state = true;
                          },
                          icon: const Icon(Icons.visibility))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            LoginButton(
                emailControllerProvider.text, passwordControllerProvider.text),
          ],
        ),
      ),
    );
  }
}
