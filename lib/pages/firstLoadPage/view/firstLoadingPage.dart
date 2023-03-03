import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stefanos_portfolio/costants/font_styles.dart';
import 'package:stefanos_portfolio/costants/widget_style_constant.dart';
import 'package:stefanos_portfolio/models/remoteAssetsProviderState.dart';
import 'package:stefanos_portfolio/pages/firstLoadPage/loadingStringEffect/model/loadingStringEffectProviderState.dart';

class FirstLoadingPage extends StatefulWidget {
  const FirstLoadingPage({super.key});

  @override
  State<FirstLoadingPage> createState() => _FirstLoadingPageState();
}

class _FirstLoadingPageState extends State<FirstLoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // after the widget build is complete
      context.read<LoadingStringEffectProviderState>().startLoadigPageStringTransition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteAssetsProviderState>(
      builder: (context, provider, child) {
        return IgnorePointer(
          child: AnimatedOpacity(
            opacity: provider.loadPageOpacity,
            duration: Duration(milliseconds: 700),
            curve: Curves.decelerate,
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 22, 12, 68),
              body: Consumer2<LoadingStringEffectProviderState, RemoteAssetsProviderState>(
                builder: (context, loadingStringEffectProviderState, remote, child) {
                  return Container(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(kDefaultPadding * 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    loadingStringEffectProviderState.stringLine1,
                                    style: FontStyles.melodiMonoExtraLight,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: kDefaultPadding / 2),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    loadingStringEffectProviderState.stringLine2,
                                    style: FontStyles.melodiMonoExtraLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              )
            ),
          ),
        );
      }
    );
  }
}