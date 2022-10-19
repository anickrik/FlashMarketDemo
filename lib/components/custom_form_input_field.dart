
import 'package:flutter/material.dart';

class CustomFormInputField extends StatelessWidget {
  final String label;
  final bool isAsterisk;
  final TextFormField textFormField;
  const CustomFormInputField({Key? key, required this.isAsterisk, required this.textFormField, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dataEntered = false;
    return Column(
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
          // height: defaultInputFieldHeight,
          child: textFormField
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 8.0),
          child: Visibility(
            visible: dataEntered,
            child: const Text("error",
              style: TextStyle(fontSize: 12),
            ),),
        ),
      ],
    );
  }
}


Widget customFormInputField(String label, String hintText, bool iaObscure,
    TextInputType keyboardType, bool isAsterisk) {
  bool dataEntered = false;
  return Column(
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
          // height: defaultInputFieldHeight,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter a $label";
              }
              return null;
            },

            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              height: 1.2,
              fontSize: 20,
            ),
            keyboardType: keyboardType,
            obscureText: iaObscure,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top:4, left: 15),
              // helperText: "",
              // isDense: true,
              // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: hintText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 8.0),
          child: Visibility(
            visible: dataEntered,
            child: const Text("error",
            style: TextStyle(fontSize: 12),
          ),),
        ),
      ],
  );
}