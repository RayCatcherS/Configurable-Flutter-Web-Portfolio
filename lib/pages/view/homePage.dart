import 'package:flutter/material.dart';

import '../../pageElements/footer/footer.dart';
import '../homeCover/homeCover.dart';
import '../professionalProjects/professionalProjects.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCover(),
            ProfessionalProjects(),
            PageFooter()
          ],
        ),
      ),
    );
  }
}