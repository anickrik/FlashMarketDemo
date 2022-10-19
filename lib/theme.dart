import 'package:flutter/material.dart';

import 'constrains/constants.dart';
import 'constrains/fm_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    errorColor: Colors.red,
    focusColor: Colors.grey,
    primaryColor: FmColors().mPrimaryColor,
    secondaryHeaderColor: Colors.black87,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: FmColors().mPrimaryColor
    ).copyWith(secondary: FmColors().fmGray3),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
  );
  OutlineInputBorder outlineInputBorderColored = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    focusColor: Colors.grey,
    contentPadding: const EdgeInsets.only(top:4, left: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

// TextTheme textTheme() {
//   return TextTheme(
//     bodyText1: TextStyle(color: kTextColor),
//     bodyText2: TextStyle(color: kTextColor),
//   );
// }
//
// AppBarTheme appBarTheme() {
//   return AppBarTheme(
//     color: Colors.white,
//     elevation: 0,
//     brightness: Brightness.light,
//     iconTheme: IconThemeData(color: Colors.black),
//     textTheme: TextTheme(
//       headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
//     ),
//   );
// }
