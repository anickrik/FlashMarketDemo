import 'package:flash_market/size_config.dart';
import 'package:flutter/material.dart';

import '../constrains/constants.dart';

Widget customFormInputField(String label, String hintText, bool iaObscure,
    TextInputType keyboardType, bool isAsterisk) {
  return SizedBox(
    // height: getProportionateScreenHeight(58),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26, bottom: 7),
          child: isAsterisk
              ? RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.black),
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.red),
                ),
              ],
            ),
          )
              : RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: defaultInputFieldHeight,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a $label';
              }
              return null;
            },
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontSize: 16,
            ),
            keyboardType: keyboardType,
            obscureText: iaObscure,
            decoration: InputDecoration(
              // isDense: true,
              // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: hintText,
            ),
          ),
        ),
      ],
    ),
  );
}