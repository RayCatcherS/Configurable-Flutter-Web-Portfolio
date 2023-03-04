import 'package:GameDevPortfolio/costants/font_styles.dart';
import 'package:GameDevPortfolio/costants/widget_style_constant.dart';
import 'package:GameDevPortfolio/models/remoteAssetsProviderState.dart';
import 'package:GameDevPortfolio/pages/firstLoadPage/loadingStringEffect/model/loadingStringEffectProviderState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: kDefaultPadding * 3,
                                  right: kDefaultPadding * 3.7,
                                  left: kDefaultPadding * 3.7
                                ),
                                child: Container(
                                  color: Colors.white12,
                                  height: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
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
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.3,
                                  right: kDefaultPadding * 3.7,
                                  left: kDefaultPadding * 3.7
                                ),
                                child: Container(
                                  color: Colors.white12,
                                  height: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: kDefaultPadding * 3.7,
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          remote.stringLoadState,
                                          style: FontStyles.melodiMonoExtraLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: kDefaultPadding * 1.1,
                                  bottom: kDefaultPadding * 3,
                                  right: kDefaultPadding * 3.7,
                                  left: kDefaultPadding * 3.7
                                ),
                                child: Container(
                                  color: Colors.white12,
                                  height: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
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