import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/gameConceptProjects/model/gameConceptProjectsProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/personalProjects/model/personalProjectsProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/professionalProjects/model/professionalProjectsProviderState.dart';

import 'pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';
import 'pages/homePage/homePageComponents/homeCover/homeCoverProviderState.dart';
import 'pages/homePage/homePageComponents/otherProjects/model/otherProjectsProviderState.dart';
import 'pages/homePage/view/homePage.dart';
import 'pages/homePage/model/homePageProviderState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => HomeCoverProviderState()),
        ChangeNotifierProvider(create: (_) => ProfessionalProjectsProviderState()),
        ChangeNotifierProvider(create: (_) => PersonalProjectsProviderState()),
        ChangeNotifierProvider(create: (_) => GameConceptProjectsProviderState()),
        ChangeNotifierProvider(create: (_) => OtherProjectsProviderState()),
        ChangeNotifierProvider(create: (_) => AboutMeProviderState()),
      ],
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Stefano Romanelli Game Programmer / Programmer',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}


