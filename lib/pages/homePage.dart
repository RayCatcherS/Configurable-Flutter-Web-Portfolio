import 'package:flutter/material.dart';

import 'homeCover/homeCover.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCover()
            
          ],
        ),
      ),
    );
  }
}