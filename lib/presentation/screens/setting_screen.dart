import 'package:flutter/material.dart';

import '../widgets/link_button.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final List<String> _labelTextList = [
    "プロフィール",
    "利用規約",
    "公式Twitter",
    "公式Instagram"
  ];
  final List<String> _linkURLList = [
    "https://koichi5.github.io/finder_seller/",
    "https://twitter.com/VTA79597664",
    "https://www.instagram.com/",
  ];
  final List<Widget> _leadingWidget = [
    const Icon(
      Icons.person,
      size: 30,
      color: Colors.black,
    ),
    const Icon(
      Icons.list_alt,
      size: 30,
      color: Colors.black,
    ),
    Image.asset(width: 30, height: 30, "assets/images/twitter.png"),
    Image.asset(width: 30, height: 30, "assets/images/instagram.png")
  ];

  final _linkButton = LinkButton();

  @override
  Widget build(BuildContext context) {
    final onTapList = [
      () => Navigator.pushNamed(context, '/profile_edit'),
      () => _linkButton.launchUriWithString(context, _linkURLList[0]),
      () => _linkButton.launchUriWithString(context, _linkURLList[1]),
      () => _linkButton.launchUriWithString(context, _linkURLList[2]),
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
        }
    );
  }
}
