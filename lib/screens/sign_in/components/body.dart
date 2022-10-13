import 'package:flash_market/screens/sign_in/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flash_market/size_config.dart';
import 'package:flash_market/components/custom_appbar_icon_skip.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Stack(
        alignment: Alignment.topRight,
        children: const [
          SignInForm(),
          CustomAppbarIconSkip(),
        ],
      ),
    );
  }
}
