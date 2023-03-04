import 'package:GameDevPortfolio/costants/font_styles.dart';
import 'package:GameDevPortfolio/costants/widget_style_constant.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/contactMe/model/contactMeProviderState.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/homeCover/contactBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: getPagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding * 17),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        context.read<ContactMeProviderState>().contactMeTitle,
                        style: FontStyles.melodiRegularTitle,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding),
                    child: Text(
                      context.read<ContactMeProviderState>().contactMeDescription,
                      style: FontStyles.melodiLight,
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: kDefaultPadding * 5),
              ContactsBar(),
              const SizedBox(height: kDefaultPadding * 30),
            ],
          ),
        ),
      ),
    );
  }
}