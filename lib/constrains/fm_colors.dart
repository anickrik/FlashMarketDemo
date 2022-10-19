
import 'package:flutter/material.dart';

Map<int, Color> color =
{
  50:const Color.fromRGBO(136,14,79, .1),
  100:const Color.fromRGBO(136,14,79, .2),
  200:const Color.fromRGBO(136,14,79, .3),
  300:const Color.fromRGBO(136,14,79, .4),
  400:const Color.fromRGBO(136,14,79, .5),
  500:const Color.fromRGBO(136,14,79, .6),
  600:const Color.fromRGBO(136,14,79, .7),
  700:const Color.fromRGBO(136,14,79, .8),
  800:const Color.fromRGBO(136,14,79, .9),
  900:const Color.fromRGBO(136,14,79, 1),
};

class FmColors {
  Color fmPrimaryColor = const Color(0xFFed1c23);
  Color fmGray5 = const Color(0xFFdfdfdf);
  Color fmGray3 = const Color(0xFFfaf9f9);

  MaterialColor mPrimaryColor =  MaterialColor(0xFFed1c23, color);
  MaterialColor mGray5 =  MaterialColor(0xFFed1c23, color);
  MaterialColor mGray3 =  MaterialColor(0xFFed1c23, color);

}