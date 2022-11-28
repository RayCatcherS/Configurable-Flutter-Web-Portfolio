import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/pages/personalProjects/model/personalProjectsProviderState.dart';
import 'package:sr_portfolio/pages/professionalProjects/model/professionalProjectsProviderState.dart';

import '../../../pageElements/footer/footer.dart';
import '../../personalProjects/personalProjects.dart';
import '../homeCover/homeCover.dart';
import '../../professionalProjects/professionalProjects.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> list = getWidgetList(context);

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

  List<Widget> getWidgetList(BuildContext context) {

    List<Widget> allWidgetList = [];

    // init home cover
    allWidgetList.add(HomeCover());

    // init profesional projects list 
    List<Widget> professionalProjects = ProfessionalProjects.professionalProjectsList(
        context.read<ProfessionalProjectsProviderState>().personalProjects, context);
    for(int i = 0; i < professionalProjects.length; i++) {
      allWidgetList.add(
        professionalProjects[i]
      );
    }

    // init personal project list
    List<Widget> personalProjects = PersonalProjects.personalProjectsList(
        context.read<PersonalProjectsProviderState>().personalProjects, context);
    for(int i = 0; i < personalProjects.length; i++) {
      allWidgetList.add(
        personalProjects[i]
      );
    }


    // init page footer
    allWidgetList.add(PageFooter());

    
    return allWidgetList;
  }
}