
import 'package:flash_market/screens/change_password/components/body.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routeName = '/change-password';
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
