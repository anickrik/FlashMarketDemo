import 'package:flutter/material.dart';

import '../size_config.dart';

class FullWidthButton extends StatelessWidget {
  final Function? onPress;
  final String title;
  final double textSize;


  const FullWidthButton({Key? key, required this.onPress, required this.title, required this.textSize,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(54),
      child: ElevatedButton(
        onPressed: (onPress == null) ? null : onPress as void Function(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        child: Text(
           title,
          style: TextStyle(fontSize: textSize,fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
