import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sr_portfolio/UI/responsive.dart';
import 'package:sr_portfolio/appFunctions.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';

import '../../costants/font_styles.dart';
import '../projectsItem/data/projectItemData.dart';




class ProjectItem extends StatelessWidget {

  final ProjectItemData projectItemData;
  
  const ProjectItem({
    Key? key,
    required this.projectItemData
  }) : super(key: key);

  final int textContentFlexSize = 3; 
  final int mediaFlexSize = 3;
  final double mediaHeight = 250;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        // project background 
        Positioned.fill(
          child: Image.network(
              projectItemData.backgroundCoverImage,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
          ),
        ),

        // image background color filter
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          )
        ),

        // project item render
        Container(
          child: Center(
            child: Padding(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 8.5),
                  child: Column(
                    children: [

                      if(!Responsive.isMobile(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Expanded(
                            flex: textContentFlexSize,
                            child: getCoverTextWidget(context),
                          ),
                          Spacer(),
                          Expanded(
                            flex: mediaFlexSize,
                            child: getMediaWidget()
                          ),
                          
                        ],
                      ),

                      if(Responsive.isMobile(context))
                      Column(
                        children: [
                          getMediaWidget(),
                          SizedBox(height: kDefaultPadding * 3),
                          getCoverTextWidget(context) 
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getMediaWidget() {
    if(projectItemData.itemType == ItemType.urlImage) {
      return AspectRatio(
        aspectRatio: 15/9,
        child: Container(
          color: Colors.red,
        ),
      );
    } else if(projectItemData.itemType == ItemType.urlVideo) {
          return AspectRatio(
            aspectRatio: 15/9,
            child: Container(
              color: Colors.red,
            ),
          );
    } else if(projectItemData.itemType == ItemType.youTubeVideo) {
          return AspectRatio(
            aspectRatio: 15/9,
            child: Container(
              color: Colors.red,
            ),
          );
    } else {
      return Text("Media Error");
    }
  }

  Widget getCoverTextWidget(BuildContext context) {
    return Column(
      children: [

        // project title
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.title,
                style: FontStyles.melodiMediumTitle,
              )
            ),
          ],
        ),

        // professional roles
        SizedBox(height: kDefaultPadding * 2),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.professionalRoles,
                style: FontStyles.melodiMediumSubTitle,
              )
            ),
          ],
        ),

        // company project
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.company.companyName,
                style: FontStyles.melodiLightSubTitle,
              )
            ),
          ],
        ),

        // project platform
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.platforms,
                style: FontStyles.melodiLightSubTitle,
              )
            ),
          ],
        ),
        

        // call to action
        Column(
          children: [
            if(projectItemData.callToActionText != "")
            SizedBox(height: kDefaultPadding * 5),
            if(projectItemData.callToActionText != "")
            MaterialButton(
              color: Colors.purple[900],
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 1),
                child: Text(
                  projectItemData.callToActionText,
                  style: FontStyles.melodiLightButtonText,
                ),
              ),
              onPressed: () {
                AppFunctions.openPageInANewTab(projectItemData.callToActionUrl);
              },
            )
          ],
        )
      ],
    );
  }
}