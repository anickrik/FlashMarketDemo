import 'package:flutter/material.dart';

class LabelTitle extends StatelessWidget {
  final String title;
  final Color textColor;
  const LabelTitle({Key? key, required this.title, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textWidthBasis: TextWidthBasis.parent,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: textColor,
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
