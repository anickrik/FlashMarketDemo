import 'package:flutter/material.dart';

class HeaderSubtitle extends StatelessWidget {
  final String subtitle;
  const HeaderSubtitle({Key? key, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: 'Roboto', fontSize: 15, color: Colors.grey),
    );
  }
}
