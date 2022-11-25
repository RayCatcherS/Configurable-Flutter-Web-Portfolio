import 'dart:html' as html;

class AppFunctions {
  static void openPageInANewTab(String link) {
    html.window.open(link, "_blank");
  }
}