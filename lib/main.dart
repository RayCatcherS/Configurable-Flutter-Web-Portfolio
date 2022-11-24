import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/homeCover/homeCoverProviderState.dart';
import 'pages/homePage.dart';
import 'pages/homePageProviderState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => HomeCoverProviderState()),
      ],
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}


