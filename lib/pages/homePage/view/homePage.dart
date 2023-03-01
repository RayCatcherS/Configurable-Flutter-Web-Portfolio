import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/ProjectGroups/model/ProjectGroupProviderState.dart';


import '../homePageComponents/aboutMe/view/aboutMe.dart';
import '../homePageComponents/contactMe/view/footer.dart';
import '../homePageComponents/homeCover/homeCover.dart';
import '../homePageComponents/ProjectGroups/view/ProjectGroups.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> list = getWidgetList(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: ListView(
        //itemCount: list.length,
        physics: const ClampingScrollPhysics(),
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

    // init projects groups list 
    List<Widget> projectGroups = ProjectGroupsWidget.projectGroupList(
        context.read<ProjectGroupsProviderState>().projectsGroups, context);
    for(int i = 0; i < projectGroups.length; i++) {
      allWidgetList.add(
        projectGroups[i]
      );
    }

    // about me
    allWidgetList.add(AboutMe());

    // init page footer
    allWidgetList.add(PageFooter());
    
    return allWidgetList;
  }
}