import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/presentation/screens/category_set_screen.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';
import 'package:quiz_app/presentation/screens/login_screen.dart';
import 'package:quiz_app/presentation/screens/option_set_screen.dart';
import 'package:quiz_app/presentation/screens/question_set_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_set_screen.dart';
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
        // '/category_set': (BuildContext context) => const CategorySetScreen(),
        // '/quiz_set': (BuildContext context) => const QuizSetScreen(),
        // '/question_set': (BuildContext context) => const QuestionSetScreen(),
        // '/option_set': (BuildContext context) => const OptionSetScreen(),
      },
      home: const IntroSliderScreen(),
    );
  }
}
