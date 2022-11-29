import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sr_portfolio/pages/gameConceptProjects/model/gameConceptProjectsProviderState.dart';
import 'package:sr_portfolio/pages/personalProjects/model/personalProjectsProviderState.dart';
import 'package:sr_portfolio/pages/professionalProjects/model/professionalProjectsProviderState.dart';

import 'pages/homePage/homeCover/homeCoverProviderState.dart';
import 'pages/homePage/view/homePage.dart';
import 'pages/model/homePageProviderState.dart';

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


