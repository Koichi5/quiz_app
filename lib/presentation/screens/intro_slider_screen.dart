import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';

class IntroSliderScreen extends StatelessWidget {
  IntroSliderScreen({Key? key}) : super(key: key);

  final List<ContentConfig> slides = [
    const ContentConfig(
        title: "ようこそ Tech Journey へ！",
        styleTitle: TextStyle(color: Colors.cyan, fontSize: 20),
        pathImage: "assets/images/sample_logo.png",
        widthImage: 230,
        heightImage: 230,
        backgroundColor: Colors.white),
    ContentConfig(
      title: "高校情報レベルの単語を出題",
      centerWidget: Lottie.asset(
        "assets/json_files/intro_slider1.json",
        width: 250,
        height: 250,
      ),
      styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
      description: "IQ でこれからの時代の\n常識を身につけよう！",
      styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
      backgroundColor: Colors.white,
    ),
    ContentConfig(
        title: "自分の問題を作成しよう！",
        centerWidget: Lottie.asset(
          "assets/json_files/intro_slider2.json",
          width: 250,
          height: 250,
        ),
        styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
        description: "問題を作成して効率的に\n学習しよう！",
        styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
        backgroundColor: Colors.white),
    ContentConfig(
      title: "苦手な問題を登録しよう！",
      centerWidget: Lottie.asset(
        "assets/json_files/intro_slider3.json",
        width: 250,
        height: 250,
      ),
      styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
      description: "問題を登録して繰り返し復習しよう！",
      styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
      backgroundColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      listContentConfig: slides,
      renderSkipBtn: const Text("スキップ"),
      renderNextBtn: const Text("次へ"),
      renderDoneBtn: renderDoneBtn(context),
    );
  }

  Widget renderDoneBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/signup");
      },
      child: const Text("終了"),
    );
  }
}
