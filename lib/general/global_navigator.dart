import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class GlobalNavigator {
  static void showErrorDialog(
      String title,
      String description, {
        String buttonText = 'OK',
        void Function()? onButtonPressed,
      }) {
    if (navigatorKey.currentContext == null) {
      return;
    }
    showDialog(context: navigatorKey.currentContext!, builder: (context) {
      return SimpleDialog(
        title: Text(title),
        children: [
          Text(description),
        ],
      );
    });
    // Navigator.of(navigatorKey.currentContext!).push(
    //   PageRouteBuilder<void>(
    //     opaque: false,
    //     transitionDuration: const Duration(milliseconds: 100),
    //     pageBuilder: (
    //         BuildContext context,
    //         Animation<double> animation,
    //         Animation<double> secondaryAnimation,
    //         ) {
    //       return FullScreenErrorView(
    //         title: title,
    //         description: description,
    //         buttonText: buttonText,
    //         onTap: onButtonPressed,
    //       );
    //     },
    //     transitionsBuilder: (
    //         BuildContext context,
    //         Animation<double> animation,
    //         Animation<double> secondaryAnimation,
    //         Widget child,
    //         ) {
    //       return FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       );
    //     },
    //   ),
    // );
  }

  static void pop() {
    if (navigatorKey.currentContext == null) {
      return;
    }
    Navigator.of(navigatorKey.currentContext!).pop();
  }
}
