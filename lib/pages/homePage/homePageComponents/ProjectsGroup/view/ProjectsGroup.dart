import 'package:GameDevPortfolio/costants/font_styles.dart';
import 'package:GameDevPortfolio/costants/widget_style_constant.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/ProjectsGroup/model/ProjectsGroupProviderState.dart';
import 'package:GameDevPortfolio/pages/projectsItem/data/projectsGroup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../projectsItem/projectItem.dart';

class ProjectsGroupWidget extends StatelessWidget {
  const ProjectsGroupWidget({
    Key? key
  }) : super(key: key);

  static List<Widget> projectGroupList(List<ProjectGroup> projectGroups, BuildContext context) {
    
    // init
    List<Widget> widgetList = [];
    
    // build project groups
    for(int i = 0; i < projectGroups.length; i++) {
      widgetList.add(
        const SizedBox(height: kDefaultPadding * 6)
      );
      widgetList.add(
        Padding(
          padding: getPagePadding(context),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: kMaxWidthPage
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          projectGroups[i].projectGroupName,
                          style: FontStyles.melodiLightTitle,
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding * 1),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          projectGroups[i].projectGroupDescription,
                          style: FontStyles.melodiLightSubTitle,
                        ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      );

      widgetList.add(
        const SizedBox(height: kDefaultPadding * 8)
      );

      // build project list
      for(int j = 0; j < projectGroups[i].projectItemDataList.length; j++) {
        widgetList.add(
          ProjectItem(projectItemData: projectGroups[i].projectItemDataList[j])
        );
      }
    }


    

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {

    List<ProjectGroup> projectGroups 
    = context.read<ProjectsGroupsProviderState>().projectsGroups;

    return Column(
      children: projectGroupList(projectGroups, context),
    );
  }
}