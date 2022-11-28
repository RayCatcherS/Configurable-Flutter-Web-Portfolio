import 'package:flutter/material.dart';

import '../../../pageElements/footer/footer.dart';
import '../../personalProjects/personalProjects.dart';
import '../homeCover/homeCover.dart';
import '../../professionalProjects/professionalProjects.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> list = getWidgetList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      body: ListView.builder(
        itemCount: list.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return list[index];
        },
      ),
    );
  }

  List<Widget> getWidgetList() {

    return [
      HomeCover(),
      ProfessionalProjects(),
      PersonalProjects(),
      PageFooter()
    ];
  }
}