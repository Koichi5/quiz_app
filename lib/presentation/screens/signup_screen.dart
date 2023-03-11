import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/controller/signup_text_controller.dart';
import 'package:quiz_app/presentation/controller/validator/signup_validator_provider.dart';
import 'package:quiz_app/presentation/widgets/apple_signin_button.dart';
import 'package:quiz_app/presentation/widgets/custom_text_field.dart';
import 'package:quiz_app/presentation/widgets/google_signin_button.dart';
import 'package:quiz_app/presentation/widgets/link_button.dart';
import 'package:quiz_app/presentation/widgets/signup_button.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkButton = LinkButton();
    final emailControllerProvider =
        ref.watch(signupEmailControllerStateProvider);
    final passwordControllerProvider =
        ref.watch(signupPasswordControllerStateProvider);
    final obscureText = ref.watch(signupObscureTextStateProvider);
    final obscureTextControllerNotifier =
        ref.watch(signupObscureTextStateProvider.notifier);
    final signupValidator = ref.watch(signupValidatorProvider);
    final signupValidatorNotifier = ref.watch(signupValidatorProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("新規登録"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomTextField(
                    title: "メールアドレス",
                    controller: emailControllerProvider,
                    error: signupValidator.form.email.errorMessage,
                    onChanged: (email) {
                      signupValidatorNotifier.setEmail(email);
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
                      error: signupValidator.form.password.errorMessage,
                      onChanged: (password) {
                        signupValidatorNotifier.setPassword(password);
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
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SignUpButton(emailControllerProvider.text,
                    passwordControllerProvider.text),
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
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "アカウントをお持ちの方はこちら",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: '登録をすることで',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      TextSpan(
                          text: '利用規約',
                          style: const TextStyle(color: Colors.blue, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              linkButton.launchUriWithString(context,
                                  "https://terms-of-service-tech.web.app/");
                            }),
                      const TextSpan(
                        text: "と",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      TextSpan(
                          text: 'プライバシーポリシー',
                          style: const TextStyle(color: Colors.blue, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              linkButton.launchUriWithString(
                                  context, "https://quiz-app-dc8a1.web.app");
                            }),
                    ],
                  ),
                ),
                const Text("に同意したことになります", style: TextStyle(fontSize: 12),),
                const Text("ご利用になる前に必ずお読みください", style: TextStyle(fontSize: 12),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
