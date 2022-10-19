
import 'package:flash_market/components/custom_app_bar.dart';
import 'package:flash_market/components/custom_widgets.dart';

import 'package:flash_market/screens/signup/components/signup_form.dart';

import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     ElevatedButton(onPressed: (){}, child: Text('skip'))
        //   ],
        // ),
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            const SignupForm(),
            CustomAppBar(
                leftIconButton: plain(),
                rightIconButton: skipButton(context),
                showRightIconButton: true,
                showLeftIconButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
