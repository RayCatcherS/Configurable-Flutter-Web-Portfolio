import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/UI/responsive.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/homeCover/homeCoverProviderState.dart';

import 'contactBar.dart';

class HomeCover extends StatelessWidget {

  HomeCover({Key? key}) : super(key: key);

  Color? coverColor = Colors.purple[900];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Positioned.fill(
          child: Image.network(
            context.read<HomeCoverProviderState>().coverImageUrl,
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
                  const Text(
                    "STEFANO ROMANELLI",
                    style: FontStyles.melodiSemiBoldTitle,
                  ),
                  Text(
                    "GAME DESIGNING / GAME PROGRAMMING",
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
                          "Hello! Il mio nome è Stefano e sono attualmente un studente laureando in informatica. Attualmente sviluppo videogames su richiesta e nel tempo libero.",
                          style: FontStyles.melodiMonoMedium,
                        ),
                        const SizedBox(height: kDefaultPadding * 3),
                        Text(
                          "In questo portfolio puoi trovare i miei progetti professionali e personali a cui ho lavorato.",
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