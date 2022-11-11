import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/Model/user.dart';

final newUserEmailProvider = StateProvider((ref) => "");
final newUserPasswordProvider = StateProvider((ref) => "");
final infoTextProvider = StateProvider((ref) => "");
// final user = User(email: "", password: "");


class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var newUserEmail = ref.watch(newUserEmailProvider);
    var newUserPassword = ref.watch(newUserPasswordProvider);
    var infoText = ref.watch(infoTextProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("新規登録"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 20),
            child: TextFormField(
              autofocus: true,
              // テキスト入力のラベルを設定
              decoration: InputDecoration(labelText: "メールアドレス"),
              onChanged: (String value) {
                newUserEmail = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "パスワード（６文字以上）"),
              // パスワードが見えないようにする
              obscureText: true,
              onChanged: (String value) {
                newUserPassword = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  // メール/パスワードでユーザー登録
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                  await auth.createUserWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  // 登録したユーザー情報
                  final user = result.user!;
                  // final user = User(email: result.user.email!, password: password)
                  infoText = "登録OK：${user.email}";
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => WalkthroughPage2()));
                } catch (e) {
                  // 登録に失敗した場合
                  infoText = "登録NG：${e.toString()}";
                }
              },
              child: const Padding(
                padding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  '登録',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
