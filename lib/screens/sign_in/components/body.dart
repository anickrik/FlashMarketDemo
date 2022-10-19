

import 'package:flash_market/components/custom_app_bar.dart';
import 'package:flash_market/components/custom_widgets.dart';
import 'package:flash_market/screens/sign_in/components/sign_in_form.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const SignInForm(),
          CustomAppBar(
              leftIconButton: plain(),
              rightIconButton: skipButton(context),
              showLeftIconButton: false,
              showRightIconButton: true,
          ),
        ],
      ),
    );
  }
}
