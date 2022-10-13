
import 'package:flash_market/routes.dart';
import 'package:flash_market/screens/sign_in/sign_in_screen.dart';


import 'package:flutter/material.dart';

import 'package:flash_market/constrains/fm_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Market',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: FmColors().mPrimaryColor,
        secondaryHeaderColor: Colors.black87,
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: FmColors().mPrimaryColor
          ).copyWith(secondary: FmColors().fmGray3)
      ),
     initialRoute: SignInScreen.routeName,
      routes: routes,
      //Calling splash screen as First screen of Application
    );
  }
}
