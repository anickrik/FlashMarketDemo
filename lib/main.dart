
import 'package:flash_market/provider/auth.dart';
import 'package:flash_market/routes.dart';

import 'package:flash_market/screens/splash/splash_screen.dart';
import 'package:flash_market/theme.dart';


import 'package:flutter/material.dart';

import 'package:flash_market/constrains/fm_colors.dart';

import 'package:provider/provider.dart';

void main() {
  
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => Auth(),
      ),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flash Market',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        //Calling splash screen as First screen of Application
      ),
    );
  }
}