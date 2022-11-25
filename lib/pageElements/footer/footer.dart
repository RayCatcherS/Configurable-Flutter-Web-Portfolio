import 'package:flutter/material.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({Key? key}) : super(key: key);

  final double pageFooter = 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pageFooter,
    );
  }
}