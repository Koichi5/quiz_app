import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/presentation/screens/quiz_history_screen.dart';

import '../../domain/dto/quiz_result.dart';

class QuizResultScreen extends StatefulHookConsumerWidget {
  static const routeName = '/quizResult';
  final QuizResult result;
  const QuizResultScreen({required this.result, Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState(result: result);
  // _QuizResultScreenState createState() => _QuizResultScreenState(this.result);
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  final QuizResult result;
  int totalQuestions = 0;
  double totalCorrect = 0;

  _QuizResultScreenState({required this.result});

  @override
  void initState() {
    setState(() {
      totalCorrect = result.totalCorrect;
      totalQuestions = result.questionList.length;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // decoration: ThemeHelper.fullScreenBgBoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            quizResultInfo(result),
            bottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget bottomButtons() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Close",
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
            // width: 150,
            // height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, QuizHistoryScreen.routeName);
            },
            child: Text(
              "History",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget quizResultInfo(QuizResult result) {
    return Column(
      children: [
        // Image(
        //   image: AssetImage("assets/images/quizResultBadge.png"),
        // ),
        Text(
          "Congratulations!",
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          "You have completed the quiz",
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          "Your Score",
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          "$totalCorrect/$totalQuestions",
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
