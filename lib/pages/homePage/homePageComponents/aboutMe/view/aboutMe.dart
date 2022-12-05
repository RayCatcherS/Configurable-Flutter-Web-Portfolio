import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/UI/responsive.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ?
        kDefaultDesktopPagePadding : 
        Responsive.isTablet(context) ?
        kDefaultTabletPagePadding : kDefaultMobilePagePadding
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kDefaultPadding * 10),
          Row(
            children: const [
              Expanded(
                child: Text(
                    "About Me",
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
              const SizedBox(width: kDefaultPadding),
              aboutMeDescription(context)
            ],
          )
          else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileImage(context),
              const SizedBox(width: kDefaultPadding),
              Expanded(child: aboutMeDescription(context))
            ],
          )
        ],
      ),
    );
  }

  Widget profileImage(BuildContext context) {
    return Image.network(
      context.read<AboutMeProviderState>().pictureProfile,
      height: Responsive.isMobile(context) ? null : 300,
      width: Responsive.isMobile(context) ? null : 300,
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