import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/models/remoteAssetsProviderState.dart';

class FirstLoadingPage extends StatelessWidget {
  FirstLoadingPage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    return Consumer<RemoteAssetsProviderState>(
      builder: (context, provider, child) {
        return IgnorePointer(
          child: AnimatedOpacity(
            opacity: provider.loadPageOpacity,
            duration: Duration(milliseconds: 350),
            curve: Curves.decelerate,
            child: const Scaffold(
              backgroundColor: Color.fromARGB(255, 22, 12, 68),
              body: Center(
                child: Padding(
                  padding: EdgeInsets.all(kDefaultPadding * 2),
                  child: Text(
                    "loading data from: https://www.stefanoromanelli.it DONE\n> Stefano Romanelli's portfolio is loading   ",
                    style: FontStyles.melodiMonoExtraLight,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}