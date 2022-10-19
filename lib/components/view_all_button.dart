
import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    Key? key,
    required this.text,
    this.press,
    required this.textColor,
    required this.buttonColor,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 95,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: buttonColor,
        ),
        onPressed: press as void Function()?,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
                Text(
                  text!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
