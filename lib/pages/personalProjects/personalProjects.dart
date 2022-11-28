import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/UI/responsive.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectItemData.dart';
import 'package:sr_portfolio/pages/professionalProjects/model/professionalProjectsProviderState.dart';
import 'package:sr_portfolio/pages/projectsItem/projectItem.dart';

import 'model/personalProjectsProviderState.dart';


class PersonalProjects extends StatelessWidget {
  const PersonalProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ProjectItemData> projects 
    = context.read<PersonalProjectsProviderState>().personalProjects;

    return Container(
      
      child: Column(
        children: [
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
                            "Personal Projects",
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectItem(projectItemData: projects[index]);
            },
          )
        ],
      ),
    );
  }
}