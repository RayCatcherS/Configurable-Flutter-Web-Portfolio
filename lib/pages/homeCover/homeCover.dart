import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/pages/homeCover/homeCoverProviderState.dart';

class HomeCover extends StatelessWidget {
  HomeCover({Key? key}) : super(key: key);

  Color? coverColor = Colors.purple[900];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            context.read<HomeCoverProviderState>().coverImage,
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
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "STEFANO ROMANELLI",
                  style: FontStyles.melodiBoldTitle,
                ),
                Text(
                  "GAME DESIGNING / GAME PROGRAMMING",
                  style: FontStyles.melodiMediumSubTitle,
                ),
                SizedBox(height: kDefaultPadding * 4),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 650
                  ),
                  child: Text(
                    "Hello! Il mio nome è Stefano e sono attualmente un studente laureando in informatica. Attualmente sviluppo videogames su richiesta e nel tempo libero.",
                    style: FontStyles.melodiMedium,
                  ),
                ),
                SizedBox(height: kDefaultPadding * 3),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 650
                  ),
                  child: Text(
                    "In questo portfolio puoi trovare i miei progetti professionali e personali a cui ho lavorato.",
                    style: FontStyles.melodiMedium,
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.white,)
                  ],
                )
              ],
            ),
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.65,
        )
      ],
    );
  }
}

/*
La mia passione per i giochi nasce fin da piccolo quando il mio Game Boy Color(2000) mi permetteva di immergermi in mondi virtuali che estendevano il concetto classico di gioco, questo mi lascerà il segno fino */
/*
Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: kDefaultPadding
                  ),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 3,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Image.network(
                            context.read<HomeCoverProviderState>().coverImage,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
*/