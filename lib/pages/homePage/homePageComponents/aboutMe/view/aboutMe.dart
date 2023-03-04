import 'dart:typed_data';

import 'package:GameDevPortfolio/UI/responsive.dart';
import 'package:GameDevPortfolio/costants/font_styles.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../costants/widget_style_constant.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: getPagePadding(context),
        child: Container(
          /*constraints: const BoxConstraints(
            maxWidth: kMaxWidthPage * 1
          ),*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding * 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        context.read<AboutMeProviderState>().title,
                        style: FontStyles.melodiRegularTitle,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding * 2),
        
              if(Responsive.isMobile(context))
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileImage(context),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  aboutMeDescription(context)
                ],
              ) else if(Responsive.isTablet(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileImage(context),
                  const SizedBox(width: kDefaultPadding * 4),
                  Expanded(child: aboutMeDescription(context)),
                ],
              )
              else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileImage(context),
                  const SizedBox(width: kDefaultPadding * 4),
                  Expanded(child: aboutMeDescription(context)),
                  Spacer()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileImage(BuildContext context) {
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: context.read<AboutMeProviderState>().pictureProfileImgData.isEmpty ? Container() :
      Image.memory(
        context.read<AboutMeProviderState>().pictureProfileImgData,
        fit: BoxFit.cover,
        height: Responsive.isMobile(context) ? null : 300,
        width: Responsive.isMobile(context) ? null : 300,
      ),
    );
  }

  Widget aboutMeDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Text(
        context.read<AboutMeProviderState>().aboutMeDescription,
        style: FontStyles.melodiLight,
      ),
    );
  }
}