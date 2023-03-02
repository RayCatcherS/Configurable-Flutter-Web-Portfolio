import 'dart:html' as html;

import 'package:flutter/material.dart';

class AppFunctions {
  static void openPageInANewTab(String link) {
    html.window.open(link, "_blank");
  }

  static void showScaffoldMessage(String s, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change.
          },
        )
      )
    );
  }
}