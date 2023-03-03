import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stefanos_portfolio/models/remoteAssetsProviderState.dart';
import 'package:video_player/video_player.dart';

import 'pages/firstLoadPage/loadingStringEffect/model/loadingStringEffectProviderState.dart';
import 'pages/firstLoadPage/view/firstLoadingPage.dart';
import 'pages/homePage/homePageComponents/ProjectsGroup/model/ProjectsGroupProviderState.dart';
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
          ChangeNotifierProvider(create: (_) => LoadingStringEffectProviderState()),


          ChangeNotifierProvider(create: (_) => RemoteAssetsProviderState()),

          ChangeNotifierProvider(create: (_) => HomeCoverProviderState()),
          ChangeNotifierProvider(create: (_) => ProjectsGroupsProviderState()),
          ChangeNotifierProvider(create: (_) => AboutMeProviderState()),
          ChangeNotifierProvider(create: (_) => ContactMeProviderState()), 
          


          // provider state links
          ChangeNotifierProxyProvider4<ProjectsGroupsProviderState, HomeCoverProviderState, AboutMeProviderState, ContactMeProviderState, RemoteAssetsProviderState>(
            create: (context) => RemoteAssetsProviderState(),
            update: (
              BuildContext context,
              ProjectsGroupsProviderState projectGroupsProviderState,
              HomeCoverProviderState homeCoverProviderState,
              AboutMeProviderState aboutMeProviderState,
              ContactMeProviderState contactMeProviderState,
              RemoteAssetsProviderState? remoteAssetsProviderState
            ) 

            => remoteAssetsProviderState!..updateLinkedModel(
              projectGroupsModel: projectGroupsProviderState,
              homeCoverModel: homeCoverProviderState,
              aboutMeModel: aboutMeProviderState,
              contactMeModel: contactMeProviderState
            )
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
    context.read<RemoteAssetsProviderState>().getMediaAssetsConfig(context);
    
  }
}
