import 'package:flutter/material.dart';
import '../../size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = '/otp';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const Body(),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("By signing up yor are Accepting the "),
            Text(
              'T&C',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const Text(" and "),
            Text(
              'Privacy policy',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
