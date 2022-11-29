import 'package:flutter/material.dart';

import '../../UI/responsive.dart';
import '../../costants/font_styles.dart';
import '../../costants/widget_style_constant.dart';
import '../projectsItem/data/projectItemData.dart';
import '../projectsItem/projectItem.dart';

class GameConceptProjects extends StatelessWidget {
  const GameConceptProjects({Key? key}) : super(key: key);

  static List<Widget> gameConceptProjectsList(List<ProjectItemData> projects, BuildContext context) {
    List<Widget> widgetList = [
      const SizedBox(height: kDefaultPadding * 6),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ?
          kDefaultDesktopPagePadding : 
          Responsive.isTablet(context) ?
          kDefaultTabletPagePadding : kDefaultMobilePagePadding
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: kMaxWidthPage
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Text(
                        "Game Concept Projects",
                        style: FontStyles.melodiLightTitle,
                      ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                        "A concepts of the game titles that I prototype",
                        style: FontStyles.melodiLightSubTitle,
                      ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
      const SizedBox(height: kDefaultPadding * 8),
    ];

    for(int i = 0; i < projects.length; i++) {
      widgetList.add(
        ProjectItem(projectItemData: projects[i])
      );
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}