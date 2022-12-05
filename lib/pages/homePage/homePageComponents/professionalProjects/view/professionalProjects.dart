import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/UI/responsive.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectItemData.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/professionalProjects/model/professionalProjectsProviderState.dart';

import '../../../../projectsItem/projectItem.dart';

class ProfessionalProjects extends StatelessWidget {
  const ProfessionalProjects({
    Key? key
  }) : super(key: key);

  static List<Widget> professionalProjectsList(List<ProjectItemData> projects, BuildContext context) {
    
    // init
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
                        "Professional Projects",
                        style: FontStyles.melodiLightTitle,
                      ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                        "A sample of the game titles that I've worked on over the years",
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


    // build project list
    for(int i = 0; i < projects.length; i++) {
      widgetList.add(
        ProjectItem(projectItemData: projects[i])
      );
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {

    List<ProjectItemData> projects 
    = context.read<ProfessionalProjectsProviderState>().personalProjects;

    return Column(
      children: professionalProjectsList(projects, context),
    );
  }
}