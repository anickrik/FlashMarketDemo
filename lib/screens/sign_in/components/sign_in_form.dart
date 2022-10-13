import 'package:flash_market/components/full_width_button.dart';
import 'package:flash_market/components/header_title.dart';
import 'package:flash_market/constrains/constants.dart';
import 'package:flash_market/screens/reset_password/reset_password_screen.dart';
import 'package:flash_market/screens/signup/signup_screen.dart';
import 'package:flash_market/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/custom_form_input_field.dart';
import '../../otp/components/body.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

bool _isObscure = false;

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 52, left: 15, right: 15, bottom: 15),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                const HeaderTitle(title: "Sign in"),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                const Text(
                  'Welcome back! Login to shop from local businesses in your area.',
                  textAlign: TextAlign.center,
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
                customFormInputField('Email or Mobile Number',
                    'i.e abc@mail.com', false, TextInputType.text, true),
                SizedBox(
                  height: getProportionateScreenHeight(30),
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
                                      color: Colors.red),
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
                          textAlignVertical: TextAlignVertical.center,
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
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(1),
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
                FullWidthButton(onPress: () {}, title: 'Login', textSize: 28,),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, SignupScreen.routeName);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
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
