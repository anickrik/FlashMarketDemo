import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

Widget customAppbarBack(BuildContext context) {
  String logo = "assets/icons/small_fm_2.svg";
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: getProportionateScreenHeight(44),
            width: getProportionateScreenWidth(44),
            child: Card(
              borderOnForeground: true,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(onPressed: () {
                  Navigator.pop(context);
                }, iconSize: 16,icon: const Icon(
                    Icons.arrow_back_ios,
                  ),),
              ),
              ),
          ),
          ),
        SizedBox(
          width: getProportionateScreenWidth(60),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(logo),
        ),
      ],
    ),
  );
}
