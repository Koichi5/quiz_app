import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quiz_app/domain/dto/quiz_result.dart';
import 'package:quiz_app/general/custom_exception.dart';
import 'package:quiz_app/presentation/screens/quiz_result_screen.dart';
import 'package:quiz_app/presentation/widgets/question_option.dart';
import 'package:quiz_app/presentation/widgets/time_indicator.dart';

import '../../application/quiz_engine.dart';
import '../../domain/category/category.dart';
import '../../domain/option/option.dart';
import '../../domain/question/question.dart';
import '../../domain/quiz/quiz.dart';
import '../../general/general_provider.dart';
import '../controller/quiz_history_controller.dart';

final questionAnswerProvider =
    StateProvider<Map<int, bool>>((ref) => {0: false});
final optionGestureProvider = StateProvider((ref) => false);
final currentQuestionIndexProvider = StateProvider((ref) => 1);
final currentQuestionTextProvider = StateProvider<String?>((ref) => "");

class QuizScreen extends StatefulHookConsumerWidget {
  static const routeName = '/quiz';
  Category? category;
  Quiz? quiz;
  final List<Question> questionList;
  final Reader reader;

  QuizScreen(
      {this.category,
      this.quiz,
      required this.questionList,
      required this.reader,
      Key? key})
      : super(key: key);

  @override
  ConsumerState<QuizScreen> createState() =>
      // ignore: no_logic_in_create_state
      _QuizScreenState(
          category: category,
          quiz: quiz,
          questionList: questionList,
          reader: reader);
}

class _QuizScreenState extends ConsumerState<QuizScreen>
    with WidgetsBindingObserver {
  late QuizEngine engine;
  late AudioPlayer _correctPlayer;
  late AudioPlayer _incorrectPlayer;
  Category? category;
  Quiz? quiz;
  final List<Question> questionList;
  int _remainTime = 0;
  Question? question;
  Timer? progressTimer;
  AppLifecycleState? appState;
  Reader reader;

  _QuizScreenState({
    required this.reader,
    required this.category,
    required this.quiz,
    required this.questionList,
  }) {
    engine = QuizEngine(
        reader: reader,
        category: category,
        questionList: questionList,
        onNext: onNextQuestion,
        onCompleted: onQuizComplete,
        onStop: onStop);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    engine.start(context);
    _setupCorrectSession();
    _setupIncorrectSession();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   reader(currentQuestionTextProvider.notifier).state = question?.text ?? "";
    // });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appState = state;
  }

  @override
  void dispose() {
    if (progressTimer != null && progressTimer!.isActive) {
      progressTimer!.cancel();
    }
    engine.stop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          quizQuestion(),
          questionOptions(),
          QuizProgress(question, progressTimer,
              remainTime: _remainTime,
              engine: engine,
              questionList: questionList,
              playIncorrectSoundFile: _playIncorrectSoundFile),
        ],
      ),
    );
  }

  // Widget screenHeader() {
  //   return Container(
  //     alignment: Alignment.center,
  //     child: Text(
  //       category != null ? category!.name : "",
  //       style: const TextStyle(fontSize: 18),
  //     ),
  //   );
  // }

  Widget quizQuestion() {
    print("question.text : ${question?.text ?? ""}");
    print(reader(currentQuestionTextProvider));
    // final questionText = reader(currentQuestionTextProvider);
      return Container(
      alignment: Alignment.centerLeft,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    "${reader(currentQuestionIndexProvider)} / ${questionList.length}"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      // TyperAnimatedText("${reader(currentQuestionTextProvider.notifier).state}",),
                      TyperAnimatedText(reader(currentQuestionTextProvider) ?? ""),
                      // TyperAnimatedText(question?.text ?? ""),
                    ],
                  ),
                  // child: Text(
                  //   question?.text ?? "",
                  //   style: const TextStyle(fontSize: 18),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget questionOptions() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Option>.from(question?.options ?? []).map((option) {
              int optionIndex = question!.options.indexOf(option);
              var optionWidget = GestureDetector(
                onTap: ref.watch(optionGestureProvider)
                    ? null
                    : () {
                        // if (!ref.watch(optionGestureProvider)) {
                        ref.watch(optionGestureProvider.notifier).state = true;
                        // setState(() {
                        print("setState");
                        _remainTime = 0;
                        ref.watch(questionAnswerProvider.notifier).state =
                            engine.updateAnswer(
                                questionIndex: questionList.indexOf(question!),
                                answer: optionIndex);
                        ref.watch(questionAnswerProvider).values.last
                            ? _playCorrectSoundFile()
                            : _playIncorrectSoundFile();
                        if (progressTimer != null) {
                          progressTimer!.cancel();
                        }
                        // });
                        // 2.5秒後に次の問題へ
                        Future.delayed(
                          const Duration(milliseconds: 2000),
                          () {
                            if (progressTimer != null) {
                              progressTimer!.cancel();
                            }
                            engine.next();
                            // 一問終了することごとに現在の問題の数が一つづつ増える
                            reader(currentQuestionIndexProvider.notifier)
                                .state++;
                            // 何かしらの選択肢を選択したら true になる provider, 画面遷移時には次の問題へ移行するため、false にする必要がある
                            // ref.watch(optionGestureProvider.notifier).state =
                            // false;
                          },
                        );
                        // 何かしらの選択肢を選択したら true になる provider, 画面遷移時には次の問題へ移行するため、false にする必要がある
                        // ref.watch(optionGestureProvider.notifier).state =
                        // false;
                        // } else {
                        //   null;
                        // }
                      },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: QuestionOption(
                    index: optionIndex,
                    option: question!.options[optionIndex],
                    isSelected: question!.options[optionIndex].isSelected,
                    optionIsCorrect:
                        ref.watch(questionAnswerProvider).values.last,
                  ),
                ),
              );
              return optionWidget;
            }).toList(),
          ),
        ),
        // option が選択されているかどうかの条件分岐 * 選択された選択肢が正しいかどうかの条件分岐
        // Icon の範囲が大きいため、テキストをタップしても Stack の下になって反応しないことがある
        // Icon から外れた部分であれば Tap が反応
        ref.watch(optionGestureProvider)
            ? ref.watch(questionAnswerProvider).values.last
                ? Icon(
                    Icons.circle_outlined,
                    size: MediaQuery.of(context).size.width * 0.7,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Icon(
                    Icons.close,
                    size: MediaQuery.of(context).size.width * 0.7,
                    color: Theme.of(context).colorScheme.error,
                  )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }

  // Widget quizProgress() {
  //   return Container(
  //     alignment: Alignment.center,
  //     child: Column(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 20),
  //           child: question != null
  //               ? TimeIndicator(
  //                   question!.duration,
  //                   _remainTime,
  //                   () {
  //                     // progressTimer!.cancel();
  //                     // _remainTime = 0;
  //                   },
  //                 )
  //               : null,
  //         ),
  //         // Text(
  //         //   "$_remainTime秒",
  //         //   style: const TextStyle(fontSize: 16),
  //         // )
  //       ],
  //     ),
  //   );
  // }

  // Widget timeLimitText (BuildContext context, int remainTime) {
  //   return remainTime == 0 ? Text("時間切れです") : Text("");
  // }

  // Widget footerButton(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             engine.stop();
  //             ref.watch(optionGestureProvider.notifier).state = false;
  //             ref.watch(questionAnswerProvider.notifier).state = {0: false};
  //             if (progressTimer != null && progressTimer!.isActive) {
  //               progressTimer!.cancel();
  //             }
  //           });
  //           Navigator.pop(context);
  //         },
  //         child: const Text(
  //           "キャンセル",
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ),
  //       // ElevatedButton(
  //       //   onPressed: () {
  //       //     engine.next();
  //       //     // 何かしらの選択肢を選択したら true になる provider, 画面遷移時には次の問題へ移行するため、false にする必要がある
  //       //     ref.watch(optionGestureProvider.notifier).state = false;
  //       //   },
  //       //   child: const Text(
  //       //     "次へ",
  //       //     style: TextStyle(fontSize: 20),
  //       //   ),
  //       // ),
  //     ],
  //   );
  // }

  Future<void> _setupCorrectSession() async {
    _correctPlayer = AudioPlayer();
    // final session = await AudioSession.instance;
    // await session.configure(AudioSessionConfiguration.speech());
    await _loadCorrectAudioFile();
  }

  Future<void> _playCorrectSoundFile() async {
    // 再生終了状態の場合、新たなオーディオファイルを定義し再生できる状態にする
    if (_correctPlayer.processingState == ProcessingState.completed) {
      await _loadCorrectAudioFile();
    }
    await _correctPlayer.play();
  }

  Future<void> _loadCorrectAudioFile() async {
    try {
      await _correctPlayer.setAsset('assets/sounds/correct_sound.mp3');
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> _setupIncorrectSession() async {
    _incorrectPlayer = AudioPlayer();
    await _loadIncorrectAudioFile();
  }

  Future<void> _playIncorrectSoundFile() async {
    // 再生終了状態の場合、新たなオーディオファイルを定義し再生できる状態にする
    if (_incorrectPlayer.processingState == ProcessingState.completed) {
      await _loadIncorrectAudioFile();
    }
    await _incorrectPlayer.play();
  }

  Future<void> _loadIncorrectAudioFile() async {
    try {
      await _incorrectPlayer.setAsset("assets/sounds/incorrect_sound.mp3");
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  void onNextQuestion(Question inputQuestion) {
    setState(() {
      if (progressTimer != null && progressTimer!.isActive) {
        // _remainTime = 0;
        progressTimer!.cancel();
      }
      question = inputQuestion;
      _remainTime = inputQuestion.duration;
      // for (int i = 0; i < inputQuestion.options.length; i++) {
      //   inputQuestion.options[i].copyWith(text: "");
      // }
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainTime >= 0) {
        try {
          if (mounted) {
            setState(() {
              progressTimer = timer;
              _remainTime--;
              // print(_remainTime);
            });
          }
        } catch (e) {
          timer.cancel();
          throw CustomException(message: e.toString());
        }
      }
      // else {
      //   ref.watch(questionAnswerProvider.notifier).state =
      //       engine.updateAnswer(
      //           questionIndex: questionList.indexOf(question!),);
      // }
    });
  }

  void onQuizComplete(
    // Quiz quiz,
    BuildContext context,
    Category? category,
    double total,
    Duration takenTime,
    List<int> takenQuestions,
    List<bool> answerIsCorrectList,
  ) {
    if (mounted) {
      setState(() {
        _remainTime = 0;
        progressTimer!.cancel();
      });
    }
    // progressTimer!.cancel();
    // print("quiz.categoryDocRef : ${quiz.categoryDocRef}");
    // Navigator.pop(context);
    if (category != null) {
      // ref
      //     .watch(categoryControllerProvider.notifier)
      //     .retrieveCategoryById(quizCategoryDocRef: quiz!.categoryDocRef!)
      //     .then((category) =>
      ref.watch(quizHistoryControllerProvider.notifier).addQuizHistory(
            user: ref.watch(firebaseAuthProvider).currentUser!,
            quizDocRef: category.quizDocRef!,
            categoryDocRef: category.categoryDocRef!,
            quizTitle: category.name,
            score: total.round(),
            questionCount: questionList.length,
            timeTakenMinutes: -takenTime.inMinutes,
            timeTakenSeconds: -takenTime.inSeconds,
            quizDate: DateTime.now(),
            status: "Complete",
            takenQuestions: takenQuestions,
            answerIsCorrectList: answerIsCorrectList,
            questionList: questionList,
            // )
          );
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          result: QuizResult(questionList: questionList, totalCorrect: total),
          takenQuestions: takenQuestions,
          answerIsCorrectList: answerIsCorrectList,
          questionList: questionList,
        ),
      ),
    );
  }
  // Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => QuizResultScreen(
  //             result: QuizResult(
  //                 quiz: quiz,
  //                 questionList: questionList,
  //                 totalCorrect: total))));

  void onStop() {
    _remainTime = 0;
    progressTimer?.cancel();
  }
}

class QuizProgress extends StatefulHookConsumerWidget {
  const QuizProgress(this.question, this.progressTimer,
      {required this.remainTime,
      required this.engine,
      required this.questionList,
      required this.playIncorrectSoundFile,
      super.key});

  final Question? question;
  final int remainTime;
  final QuizEngine engine;
  final List<Question> questionList;
  final Function playIncorrectSoundFile;
  final Timer? progressTimer;

  @override
  ConsumerState<QuizProgress> createState() => _QuizProgressState();
}

class _QuizProgressState extends ConsumerState<QuizProgress> {
  @override
  void initState() {
    // if (widget.remainTime == 0) {
    //   ref.watch(questionAnswerProvider.notifier).state = widget.engine
    //       .updateAnswer(
    //           questionIndex: widget.questionList.indexOf(widget.question!),
    //           answer: null);
    //   widget.playIncorrectSoundFile();
    //   // print(
    //   //     "ref.watch(questionAnswerProvider.notifier).state : ${ref.watch(questionAnswerProvider.notifier).state}");
    //   // print(
    //   //     "question!.options[optionIndex].isSelected : ${question!.options[optionIndex].isSelected}");
    //   // ref.watch(optionGestureProvider.notifier).state = true;
    //   widget.progressTimer!.cancel();
    // }
    // timer = Timer(const Duration(seconds: 10), () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
    //   print("changed page");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
        child: widget.question != null
            ? TimeIndicator(
                widget.question!.duration,
                widget.remainTime,
                // () {
                // progressTimer!.cancel();
                // _remainTime = 0;
                // },
              )
            : null,
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   var percent = ((progress / duration) * 100) / 100;
//   var innerWidth = ((width * percent) - borderWidth * 2);
//   var innerHeight = height - borderWidth * 2;
//   if (innerWidth < 0) {
//     innerWidth = 0;
//   }
//   if (innerHeight < 0) {
//     innerHeight = 0;
//   }
//   return Stack(
//     children: [
//       Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
//           border: Border.all(
//             width: borderWidth,
//             // color: ThemeHelper.primaryColor
//           ),
//         ),
//       ),
//       Container(
//         width: innerWidth,
//         height: innerHeight,
//         margin: EdgeInsets.all(borderWidth),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(height * 0.50)),
//           border: Border.all(
//             width: 5,
//             // color: ThemeHelper.accentColor
//           ),
//           // color: ThemeHelper.accentColor
//         ),
//       ),
//     ],
//   );
// }
