import 'package:flash_market/components/full_width_button.dart';
import 'package:flash_market/components/header_title.dart';
import 'package:flash_market/screens/otp/otp_screen.dart';
import 'package:flash_market/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flash_market/size_config.dart';

import '../../../components/custom_form_input_field.dart';
import '../../../constrains/constants.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

String downArrow = "assets/icons/hr.svg";

class _SignupFormState extends State<SignupForm> {
  bool _isObscure = false;
  final _formKey = GlobalKey<FormState>();
  var _password;

/*  Widget customFormInputField(String label, String hintText, bool iaObscure,
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
                          fontSize: 18,
                          color: Colors.black),
                      children: const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
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
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a $label';
              }
              return null;
            },
            style: const TextStyle(
              fontSize: 18,
            ),
            keyboardType: keyboardType,
            obscureText: iaObscure,
            decoration: InputDecoration(
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 52, left: 15, right: 15, bottom: 15),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(14),
                ),
                const HeaderTitle(title: "Sign up"),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                const Text(
                  'Shop for great deals from local businesses in your area.',
                  style: TextStyle(
                      fontFamily: 'Roboto', fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(13),
                ),
                SvgPicture.asset(downArrow),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                customFormInputField('First Name', 'Enter Your First Name',
                    false, TextInputType.text, true),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                customFormInputField('Last Name', 'Enter Your Last Name', false,
                    TextInputType.text, false),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                customFormInputField('Email Id', 'i.e abc123@mail.com', false,
                    TextInputType.emailAddress, true),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                customFormInputField(
                    'Mobile Number',
                    'Enter Your Mobile Number',
                    false,
                    TextInputType.number,
                    true),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                SizedBox(
                  // height: getProportionateScreenHeight(58),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 26, bottom: 5),
                          child: RichText(
                            text: const TextSpan(
                              text: 'Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: defaultInputFieldHeight,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a Password';
                            }
                            return null;
                          },
                          style: const TextStyle(fontSize: 18),
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _isObscure = !_isObscure;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: !_isObscure,
                        onChanged: (_) {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    const Text("Show password"),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                FullWidthButton(
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, OtpScreen.routeName);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpScreen()));
                    } else {}
                  },
                  title: 'Sign up',
                  textSize: 28,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account?",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignInScreen.routeName);
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
