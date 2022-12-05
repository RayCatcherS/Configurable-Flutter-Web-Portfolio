import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/gameConceptProjects/view/gameConceptProjects.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/personalProjects/model/personalProjectsProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/professionalProjects/model/professionalProjectsProviderState.dart';

import '../../../pageElements/footer/footer.dart';
import '../homePageComponents/aboutMe/view/aboutMe.dart';
import '../homePageComponents/gameConceptProjects/model/gameConceptProjectsProviderState.dart';
import '../homePageComponents/otherProjects/model/otherProjectsProviderState.dart';
import '../homePageComponents/otherProjects/view/otherProjects.dart';
import '../homePageComponents/personalProjects/view/personalProjects.dart';
import '../homePageComponents/homeCover/homeCover.dart';
import '../homePageComponents/professionalProjects/view/professionalProjects.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> list = getWidgetList(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      body: ListView(
        //itemCount: list.length,
        physics: ClampingScrollPhysics(),
        /*itemBuilder: (context, index) {
          return list[index];
        },*/
        children: list,
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

    // init concept project list
    List<Widget> conceptProjects = GameConceptProjects.gameConceptProjectsList(
        context.read<GameConceptProjectsProviderState>().gameConceptProjects, context);
    for(int i = 0; i < conceptProjects.length; i++) {
      allWidgetList.add(
        conceptProjects[i]
      );
    }

    // init other project list
    List<Widget> otherProjects = OtherProjects.OtherProjectsList(
        context.read<OtherProjectsProviderState>().otherProjects, context);
    for(int i = 0; i < otherProjects.length; i++) {
      allWidgetList.add(
        otherProjects[i]
      );
    }

    // about me
    allWidgetList.add(AboutMe());

    // init page footer
    allWidgetList.add(PageFooter());

    
    return allWidgetList;
  }
}