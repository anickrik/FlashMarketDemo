import 'package:flash_market/screens/onboard/components/body.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  static const routeName = '/on-board';
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Body(),
    );
  }
}
