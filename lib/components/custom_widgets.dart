import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../size_config.dart';

Widget backIconButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      child: Card(
        borderOnForeground: true,
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 16,
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ),
      ),
    );
}

Widget plain() {
  return const Spacer();
}

Widget skipButton(
  BuildContext context,
) {
  return Container(
          height: getProportionateScreenHeight(35),
          width: getProportionateScreenWidth(60),
          margin: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor)),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text(
                  'Skip',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
            ),
          ),
  );
}

Widget locationIconButton(BuildContext context) {
  return SizedBox(
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      child: FittedBox(
        fit: BoxFit.cover,
        child: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          iconSize: 32,
          icon: const Icon(
            Icons.pin_drop,
          ),
        ),
      ),
  );
}

Widget cartIconButton(BuildContext context) {
  return SizedBox(
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      child: FittedBox(
        fit: BoxFit.cover,
        child: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          iconSize: 32,
          icon: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ),
  );
}

Widget emptyCard(){
  return Card(
    color: Colors.orange,
  );
}
