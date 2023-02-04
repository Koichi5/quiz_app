import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';

// final sliderListProvider = StateProvider<List<ContentConfig>>((ref) => []);
//
// class IntroSliderScreen extends ConsumerWidget {
//   const IntroSliderScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final sliderListNotifier = ref.watch(sliderListProvider.notifier);
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const IntroSliderExampleSlidePage()));
//             sliderListNotifier.state.add(
//               ContentConfig(
//                   title: "ようこそ Information Quiz へ！",
//                   styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
//                   pathImage: "assets/images/sample_logo.png",
//                   widthImage: MediaQuery.of(context).size.width * 0.9,
//                   heightImage: MediaQuery.of(context).size.height * 0.3,
//                   backgroundColor: Colors.white),
//             );
//             sliderListNotifier.state.add(
//               ContentConfig(
//                 title: "高校情報レベルの単語を出題",
//                 // pathImage: "assets/images/google_logo.png",
//                 centerWidget: Lottie.asset("assets/json_files/intro_slider1.json",
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: MediaQuery.of(context).size.height * 0.3),
//                 styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
//                 description: "IQ でこれからの時代の\n常識を身につけよう！",
//                 styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
//                 backgroundColor: Colors.white,
//               ),
//             );
//             sliderListNotifier.state.add(
//               ContentConfig(
//                   title: "自分の問題を作成しよう！",
//                   // pathImage: "assets/intro_slider2.json",
//                   centerWidget: Lottie.asset("assets/json_files/intro_slider2.json",
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       height: MediaQuery.of(context).size.height * 0.3),
//                   styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
//                   description: "問題を作成して効率的に\n学習しよう！",
//                   styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
//                   backgroundColor: Colors.white),
//             );
//             sliderListNotifier.state.add(
//               ContentConfig(
//                 title: "苦手な問題を登録しよう！",
//                 // pathImage: "assets/intro_slider3.json",
//                 centerWidget: Lottie.asset("assets/json_files/intro_slider3.json",
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: MediaQuery.of(context).size.height * 0.3),
//                 styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
//                 description: "問題を登録して繰り返し復習しよう！",
//                 styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
//                 backgroundColor: Colors.white,
//               ),
//             );
//           },
//           child: const Text("チュートリアル"),
//         ),
//       ),
//     );
//   }
// }

// class IntroSliderExampleSlidePage extends ConsumerWidget {
//   const IntroSliderExampleSlidePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final slideList = ref.watch(sliderListProvider);
//     return IntroSlider(
//       listContentConfig: slideList,
//       renderSkipBtn: const Text("スキップ"),
//       renderNextBtn: const Text("次へ"),
//       renderDoneBtn: renderDoneBtn(context),
//     );
//   }
//
//   Widget renderDoneBtn(BuildContext context) {
//     return TextButton(
//         onPressed: () {
//           Navigator.pushNamed(context, "/signup");
//         },
//         child: const Text("終了"));
//   }
//
//   // Widget renderPrevBtn() {
//   //   return TextButton(onPressed: () {}, child: const Text("戻る"));
//   // }
// }

class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  _IntroSliderScreenState createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      slides.add(
      ContentConfig(
          title: "ようこそ Information Quiz へ！",
          styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
          pathImage: "assets/images/sample_logo.png",
          widthImage: MediaQuery.of(context).size.width * 0.9,
          heightImage: MediaQuery.of(context).size.height * 0.3,
          backgroundColor: Colors.white),
    );
    slides.add(
      ContentConfig(
        title: "高校情報レベルの単語を出題",
        // pathImage: "assets/images/google_logo.png",
        centerWidget: Lottie.asset("assets/json_files/intro_slider1.json",
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3),
        styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
        description: "IQ でこれからの時代の\n常識を身につけよう！",
        styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      ContentConfig(
          title: "自分の問題を作成しよう！",
          // pathImage: "assets/intro_slider2.json",
          centerWidget: Lottie.asset("assets/json_files/intro_slider2.json",
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3),
          styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
          description: "問題を作成して効率的に\n学習しよう！",
          styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
          backgroundColor: Colors.white),
    );
    slides.add(
      ContentConfig(
        title: "苦手な問題を登録しよう！",
        // pathImage: "assets/intro_slider3.json",
        centerWidget: Lottie.asset("assets/json_files/intro_slider3.json",
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3),
        styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
        description: "問題を登録して繰り返し復習しよう！",
        styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
        backgroundColor: Colors.white,
      ),
    );
    // });


    // slides.add(
    //   Slide(
    //     title: "Management",
    //     description:
    //     'Management is the administration of an organization, whether it is a business,'
    //         ' a non-profit organization, or a government body. ',
    //     pathImage: "assets/onboarding0.png",
    //     heightImage: 370,
    //     widthImage: 400,
    //     backgroundColor: const Color(0xff4266AC),
    //   ),
    // );
    // slides.add(
    //   Slide(
    //     title: "Chat",
    //     description:
    //     "Chat refers to the process of communicating, interacting and/or exchanging messages over the Internet. "
    //         "It involves two or more individuals that communicate through a chat-enabled service or software. ",
    //     pathImage: "assets/onboarding1.png",
    //     heightImage: 370,
    //     widthImage: 400,
    //     backgroundColor: const Color(0xff3852B2),
    //   ),
    // );
    // slides.add(
    //   Slide(
    //     title: "Leadership",
    //     description:
    //     "Leadership is the ability of an individual or a group of individuals to influence and guide followers or other members of an organization.  ",
    //     pathImage: "assets/onboarding2.png",
    //     heightImage: 370,
    //     widthImage: 400,
    //     backgroundColor: const Color(0xff2A78E6),
    //   ),
    // );
  }

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
        child: const Text("終了"));
  }
}
