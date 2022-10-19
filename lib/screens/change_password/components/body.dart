
import 'package:flash_market/components/custom_app_bar.dart';
import 'package:flash_market/components/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'change_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const ChangePasswordForm(),
          CustomAppBar(
              leftIconButton: backIconButton(context),
              rightIconButton: plain(),
              showRightIconButton: false,
              showLeftIconButton: true,
          ),
        ],
      ),
    );
  }
}
