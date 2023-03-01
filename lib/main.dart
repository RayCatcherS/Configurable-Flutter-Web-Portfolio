import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/ProjectGroups/model/ProjectGroupProviderState.dart';

import 'pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';
import 'pages/homePage/homePageComponents/contactMe/model/contactMeProviderState.dart';
import 'pages/homePage/homePageComponents/homeCover/homeCoverProviderState.dart';
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
        ChangeNotifierProvider(create: (_) => ProjectGroupsProviderState()),
        ChangeNotifierProvider(create: (_) => AboutMeProviderState()),
        ChangeNotifierProvider(create: (_) => ContactMeProviderState()), 
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


