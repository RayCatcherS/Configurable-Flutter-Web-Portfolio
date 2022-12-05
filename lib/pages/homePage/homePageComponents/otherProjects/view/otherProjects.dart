import 'package:flutter/material.dart';

import '../../../../../UI/responsive.dart';
import '../../../../../costants/font_styles.dart';
import '../../../../../costants/widget_style_constant.dart';
import '../../../../projectsItem/data/projectItemData.dart';
import '../../../../projectsItem/projectItem.dart';

class OtherProjects extends StatelessWidget {
  const OtherProjects({Key? key}) : super(key: key);

  static List<Widget> OtherProjectsList(List<ProjectItemData> projects, BuildContext context) {
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
                        "Other Personal Projects",
                        style: FontStyles.melodiLightTitle,
                      ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                        "Other projects in collaboration / in which I have collaborated",
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