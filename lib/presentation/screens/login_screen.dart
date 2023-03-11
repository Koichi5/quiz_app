import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/signup_screen.dart';
import 'package:quiz_app/presentation/widgets/login_button.dart';

import '../controller/login_text_controller.dart';
import '../controller/validator/login_validator_provider.dart';
import '../widgets/apple_signin_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/google_signin_button.dart';

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
        automaticallyImplyLeading: false,
        centerTitle: true,
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
              width: MediaQuery.of(context).size.width * 0.9,
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
              width: MediaQuery.of(context).size.width * 0.9,
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
            Divider(
              height: MediaQuery.of(context).size.height * 0.05,
              thickness: 0.5,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: GoogleSignInButton(),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: AppleSignInButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                },
                child: const Text(
                  "新規登録はこちら",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
