import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/general/general_provider.dart';
import 'package:quiz_app/presentation/controller/auth_controller.dart';
import 'package:quiz_app/presentation/screens/dictionary_screen.dart';
import 'package:quiz_app/presentation/screens/login_screen.dart';

import '../widgets/link_button.dart';

class SettingScreen extends HookConsumerWidget {
  SettingScreen({Key? key}) : super(key: key);

  final List<String> _labelTextList = [
    "利用規約",
    "プライバシーポリシー",
    "Twitter",
    "Instagram",
    "単語集",
    "ログアウト",
  ];
  final List<String> _linkURLList = [
    "https://terms-of-service-tech.web.app/",
    "https://quiz-app-dc8a1.web.app",
    "https://twitter.com/TechJourneyApp",
    "https://www.instagram.com/techjourneyapp/",
  ];
  final List<Widget> _leadingWidget = [
    const Icon(
      Icons.list_alt,
      size: 30,
    ),
    const Icon(
      Icons.privacy_tip_outlined,
      size: 30,
    ),
    Image.asset(width: 30, height: 30, "assets/images/twitter.png"),
    Image.asset(width: 30, height: 30, "assets/images/instagram.png"),
    const Icon(
      Icons.bookmark_outline,
      size: 30,
    ),
    const Icon(
      Icons.logout,
      size: 30,
    )
  ];

  final _linkButton = LinkButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onTapList = [
      () => _linkButton.launchUriWithString(context, _linkURLList[0]),
      () => _linkButton.launchUriWithString(context, _linkURLList[1]),
      () => _linkButton.launchUriWithString(context, _linkURLList[2]),
      () => _linkButton.launchUriWithString(context, _linkURLList[3]),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DictionaryScreen(),
          ),
        );
      },
      () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "ログアウトしますか？",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("いいえ")),
                    TextButton(
                      onPressed: ([bool mounted = true]) async {
                        await ref
                            .watch(authControllerProvider.notifier)
                            .signOut();
                        if (ref.watch(firebaseAuthProvider).currentUser ==
                            null) {
                          if (!mounted) return;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                      },
                      child: const Text(
                        "はい",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    ];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _labelTextList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Text(_labelTextList[index]),
            leading: _leadingWidget[index],
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            onTap: onTapList[index]);
      },
    );
  }
}
