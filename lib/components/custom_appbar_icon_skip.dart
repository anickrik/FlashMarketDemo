import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/home/home_screen.dart';
import '../size_config.dart';

class CustomAppbarIconSkip extends StatelessWidget {

  const CustomAppbarIconSkip({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logo = "assets/icons/small_fm_2.svg";
    return SizedBox(
      width: getProportionateScreenWidth(240),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(logo),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Container(
                  height: getProportionateScreenHeight(35),
                  width: getProportionateScreenWidth(60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor)),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
