import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/word_collection_screen.dart';

import '../widgets/link_button.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final List<String> _labelTextList = [
    "利用規約",
    "公式Twitter",
    "公式Instagram",
    "単語集",
  ];
  final List<String> _linkURLList = [
    "https://koichi5.github.io/finder_seller/",
    "https://twitter.com/VTA79597664",
    "https://www.instagram.com/",
  ];
  final List<Widget> _leadingWidget = [
    const Icon(
      Icons.list_alt,
      size: 30,
    ),
    Image.asset(width: 30, height: 30, "assets/images/twitter.png"),
    Image.asset(width: 30, height: 30, "assets/images/instagram.png"),
    const Icon(
      Icons.bookmark,
      size: 30,
    ),
  ];

  final _linkButton = LinkButton();

  @override
  Widget build(BuildContext context) {
    final onTapList = [
      () => _linkButton.launchUriWithString(context, _linkURLList[0]),
      () => _linkButton.launchUriWithString(context, _linkURLList[1]),
      () => _linkButton.launchUriWithString(context, _linkURLList[2]),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WordCollectionScreen()));
      }
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
