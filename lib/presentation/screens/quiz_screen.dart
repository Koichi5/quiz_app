import 'dart:async';

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

// ignore: must_be_immutable
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

  Widget quizQuestion() {
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
                  child: Text(
                    question?.text ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
                        ref.watch(optionGestureProvider.notifier).state = true;
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
                        Future.delayed(
                          const Duration(milliseconds: 2000),
                          () {
                            if (progressTimer != null) {
                              progressTimer!.cancel();
                            }
                            engine.next();
                            reader(currentQuestionIndexProvider.notifier)
                                .state++;
                          },
                        );
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

  Future<void> _setupCorrectSession() async {
    _correctPlayer = AudioPlayer();
    await _loadCorrectAudioFile();
  }

  Future<void> _playCorrectSoundFile() async {
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
        progressTimer!.cancel();
      }
      question = inputQuestion;
      _remainTime = inputQuestion.duration;
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainTime >= 0) {
        try {
          if (mounted) {
            setState(() {
              progressTimer = timer;
              _remainTime--;
            });
          }
        } catch (e) {
          timer.cancel();
          throw CustomException(message: e.toString());
        }
      }
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
    int timeTakenMinutes = 0;
    int timeTakenSeconds = 0;
    if (mounted) {
      setState(() {
        _remainTime = 0;
        progressTimer!.cancel();
      });
    }
    if (-takenTime.inSeconds < 60) {
      timeTakenSeconds = -takenTime.inSeconds;
    } else {
      timeTakenMinutes = (-takenTime.inSeconds / 60).floor();
      timeTakenSeconds = -takenTime.inSeconds % 60;
    }
    if (category != null) {
      ref.watch(quizHistoryControllerProvider.notifier).addQuizHistory(
            user: ref.watch(firebaseAuthProvider).currentUser!,
            quizDocRef: category.quizDocRef!,
            categoryDocRef: category.categoryDocRef!,
            quizTitle: category.name,
            score: total.round(),
            questionCount: questionList.length,
            timeTakenMinutes: timeTakenMinutes,
            timeTakenSeconds: timeTakenSeconds,
            quizDate: DateTime.now(),
            status: "Complete",
            takenQuestions: takenQuestions,
            answerIsCorrectList: answerIsCorrectList,
            questionList: questionList,
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
              )
            : null,
      ),
    );
  }
}
