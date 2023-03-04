import 'package:GameDevPortfolio/UI/responsive.dart';
import 'package:GameDevPortfolio/costants/font_styles.dart';
import 'package:GameDevPortfolio/costants/widget_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'contactBar.dart';
import 'homeCoverProviderState.dart';

class HomeCover extends StatelessWidget {

  HomeCover({Key? key}) : super(key: key);

  Color? coverColor = Colors.purple[900];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Positioned.fill(
          child: context.read<HomeCoverProviderState>().homeCoverImgData.isEmpty ? Container() :
          Image.memory(
            context.read<HomeCoverProviderState>().homeCoverImgData,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black45,
            child: Container(
              color: coverColor!.withOpacity(0.35),
            ),
          )
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<HomeCoverProviderState>().portfolioOwnerName.toUpperCase(),
                    style: FontStyles.melodiSemiBoldTitle,
                  ),
                  Text(
                    context.read<HomeCoverProviderState>().portfolioOwnerRole.toUpperCase(),
                    style: FontStyles.melodiMonoMediumSubTitle,
                  ),
                  const SizedBox(height: kDefaultPadding * 4),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 630
                    ),
                    child: Column(
                      children: [
                        Text(
                          context.read<HomeCoverProviderState>().coverDescription1,
                          style: FontStyles.melodiMonoMedium,
                        ),
                        const SizedBox(height: kDefaultPadding * 3),
                        Text(
                          context.read<HomeCoverProviderState>().coverDescription2,
                          style: FontStyles.melodiMonoMedium,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: kDefaultPadding * 5),
                  if(!Responsive.isMobile(context))
                  ContactsBar()

                  
                ],
              ),
            ),
          )
        ),

        // Social and contatcs bar
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Responsive.isMobile(context) ?
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding * 4),
                  child: ContactsBar(),
                ) : Container()
              ],
            )   
          )
        ),

        // home cover size
        Container(
          height: !Responsive.isMobile(context) ?
          580 :
          MediaQuery.of(context).size.height / 1.05,
        )
      ],
    );
  }
}

/*
La mia passione per i giochi nasce fin da piccolo quando il mio Game Boy Color(2000) mi permetteva di immergermi in mondi virtuali che estendevano il concetto classico di gioco, questo mi lascerà il segno fino
 */