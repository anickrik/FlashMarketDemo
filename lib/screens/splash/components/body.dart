import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/home_screen.dart';
import '../../../size_config.dart';
import '../../onboard/onboard_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),()=> _continue()
        //set the timer to go on next screen
      // calling the continue method for checking is user open the application first time or not
    );
  }

  _continue() async {
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('isFirstTime') ?? false;
    //stroing Shared preference data isFirstTime is true or false
    Navigator.pushReplacementNamed(context, (showHome ? HomeScreen.routeName : OnboardScreen.routeName));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => showHome ? const HomeScreen() : const OnboardScreen()));
    // on above condition redirecting user to home and onBoard Screen.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(223, 223, 223, 100),
        image: DecorationImage(image:AssetImage("assets/images/vector_2.png"), fit: BoxFit.cover)
          //loading the full screen image as background image
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset("assets/icons/flash-market.svg",width: getProportionateScreenWidth(200),)),
          //set the logo image for center
          SizedBox(
            height: getProportionateScreenHeight(37),
          ),
          const Text('Shopping Local Made Easy!',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
        ],
      ),
    );
  }
}
