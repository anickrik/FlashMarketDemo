
import 'package:flutter/material.dart';

import '../../../components/custom_appbar_back.dart';
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
          customAppbarBack(context),
        ],
      ),
    );
  }
}
