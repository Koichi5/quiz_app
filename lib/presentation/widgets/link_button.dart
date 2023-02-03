import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkButton {
  final alertSnackBar = SnackBar(
    content: const Text('このURLは開けませんでした'),
    action: SnackBarAction(
      label: '戻る',
      onPressed: () {},
    ),
  );

  Future launchUriWithString(BuildContext context, String url, [bool mounted = true]) async {
    final canLaunch = await canLaunchUrlString(url);
    if(canLaunch) {
      try {
        await launchUrlString(url);
      } catch (e) {
        // alertSnackBar;
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(alertSnackBar);
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(alertSnackBar);
    }
  }
}
