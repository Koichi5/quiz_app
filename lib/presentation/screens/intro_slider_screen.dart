import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';

final sliderListProvider = StateProvider<List<ContentConfig>>((ref) => []);

class IntroSliderScreen extends ConsumerWidget {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderListNotifier = ref.watch(sliderListProvider.notifier);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const IntroSliderExampleSlidePage()));
            sliderListNotifier.state.add(
              ContentConfig(
                  title: "ようこそ Eat me ! へ",
                  pathImage: "assets/images/google_logo.png",
                  // centerWidget: Image.asset("assets/images/waiting.png",),
                  // centerWidget: Lottie.asset("assets/intro_slider_image.json"),
                  styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                  description: "Eat me ! は〇〇するためのアプリです",
                  styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                  // pathImage: "assets/images/waiting.png",
                  backgroundColor: Colors.white),
            );
            sliderListNotifier.state.add(
              ContentConfig(
                  title: "店舗登録",
                  pathImage: "assets/images/google_logo.png",
                  // centerWidget: Lottie.asset("assets/intro_slider_image1.json",
                  //     width: MediaQuery.of(context).size.width * 0.9,
                  //     height: MediaQuery.of(context).size.height * 0.3),
                  styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                  description:
                  "自身の店舗を登録しましょう",
                  styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                  // pathImage: "assets/images/waiting.png",
                  backgroundColor: Colors.white),
            );
            sliderListNotifier.state.add(
              ContentConfig(
                title: "商品登録",
                pathImage: "assets/images/google_logo.png",
                // centerWidget: Lottie.asset("assets/intro_slider_image2.json",
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     height: MediaQuery.of(context).size.height * 0.3),
                styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                description:
                "出品した商品を登録しましょう",
                styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                // pathImage: "assets/images/waiting.png",
                backgroundColor: Colors.white,
              ),
            );
            sliderListNotifier.state.add(
              ContentConfig(
                title: "商品の予約を待つ",
                pathImage: "assets/images/google_logo.png",
                // centerWidget: Lottie.asset("assets/intro_slider_image3.json",
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     height: MediaQuery.of(context).size.height * 0.3),
                styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                description:
                "商品に予約が入るのを待ちましょう",
                styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                // pathImage: "assets/images/waiting.png",
                backgroundColor: Colors.white,
              ),
            );
            sliderListNotifier.state.add(
              ContentConfig(
                title: "受け渡し",
                pathImage: "assets/images/google_logo.png",
                // centerWidget: Lottie.asset("assets/intro_slider_image4.json",
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     height: MediaQuery.of(context).size.height * 0.3),
                styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                description:
                "商品を受け渡しましょう",
                styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                // pathImage: "assets/images/waiting.png",
                backgroundColor: Colors.white,
              ),
            );
          },
          child: const Text("チュートリアル"),
        ),
      ),
    );
  }
}

class IntroSliderExampleSlidePage extends ConsumerWidget {
  const IntroSliderExampleSlidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slideList = ref.watch(sliderListProvider);
    return IntroSlider(
      listContentConfig: slideList,
      renderSkipBtn: const Text("スキップ"),
      renderNextBtn: const Text("次へ"),
      renderDoneBtn: renderDoneBtn(context),
    );
  }

  // Widget renderNextBtn() {
  //   return TextButton(
  //       onPressed: (){},
  //       child: const Text("NEXT"));
  // }

  Widget renderDoneBtn(BuildContext context) {
    return TextButton(
        onPressed: () {
          print("チュートリアル終了");
          Navigator.pushNamed(context, "/signup");
        },
        child: const Text("終了"));
  }

  Widget renderPrevBtn() {
    return TextButton(onPressed: () {}, child: const Text("戻る"));
  }
}