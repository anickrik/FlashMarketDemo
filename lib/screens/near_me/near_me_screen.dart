import 'package:flutter/material.dart';

import 'components/near_me_body.dart';


class NearMeScreen extends StatelessWidget {
  static const routeName = '/near_me';
  const NearMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NearMeBody(),
    );
  }
}