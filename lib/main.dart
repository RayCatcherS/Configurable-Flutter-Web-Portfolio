import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/costants/font_styles.dart';
import 'package:sr_portfolio/costants/widget_style_constant.dart';
import 'package:sr_portfolio/models/remoteAssetsProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/ProjectGroups/model/ProjectGroupProviderState.dart';

import 'pages/firstLoadPage/view/firstLoadingPage.dart';
import 'pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';
import 'pages/homePage/homePageComponents/contactMe/model/contactMeProviderState.dart';
import 'pages/homePage/homePageComponents/homeCover/homeCoverProviderState.dart';
import 'pages/homePage/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stefano Romanelli Game Programmer / Programmer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RemoteAssetsProviderState()),

          ChangeNotifierProvider(create: (_) => HomeCoverProviderState()),
          ChangeNotifierProvider(create: (_) => ProjectGroupsProviderState()),
          ChangeNotifierProvider(create: (_) => AboutMeProviderState()),
          ChangeNotifierProvider(create: (_) => ContactMeProviderState()), 


          // provider state links
          ChangeNotifierProxyProvider<ProjectGroupsProviderState, RemoteAssetsProviderState>(
            create: (context) => RemoteAssetsProviderState(),
            update: (BuildContext context, ProjectGroupsProviderState projectGroupsProviderState, RemoteAssetsProviderState? remoteAssetsProviderState) 
            => remoteAssetsProviderState!..updateLinkedModel(projectGroupsModel: projectGroupsProviderState)
          ),
        ],
        builder: ((context, child) {
    
          startMethods(context);
    
          return Stack(
            children: [
              HomePage(),
              
              FirstLoadingPage()
            ],
          );
        }),
      ),
    );
  }


  void startMethods(BuildContext context) {
    context.read<RemoteAssetsProviderState>().loadAssetsContent(context);
  }
}


