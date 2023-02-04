import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';
import 'package:quiz_app/presentation/screens/login_screen.dart';
import 'package:quiz_app/presentation/screens/signup_screen.dart';

import 'color_schemes.g.dart';
import 'presentation/screens/intro_slider_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz-app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routes: {
        '/home': (BuildContext context) => const HomeScreen(),
        '/signup': (BuildContext context) => const SignupScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        // '/profile_edit' : (BuildContext context) => const ProfileEditScreen(),
        // '/category_set': (BuildContext context) => const CategorySetScreen(),
        // '/quiz_set': (BuildContext context) => const QuizSetScreen(),
        // '/question_set': (BuildContext context) => const QuestionSetScreen(),
        // '/option_set': (BuildContext context) => const OptionSetScreen(),
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // スプラッシュ画面などに書き換えても良い
            return const SizedBox();
          }
          if (snapshot.hasData) {
            // User が null でなない、つまりサインイン済みのホーム画面へ
            return HomeScreen();
          }
          // User が null である、つまり未サインインのサインイン画面へ

          return IntroSliderScreen();
        },
      ),
    );
  }
}
