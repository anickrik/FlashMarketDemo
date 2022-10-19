import 'package:flash_market/components/full_width_button.dart';
import 'package:flash_market/components/header_title.dart';
import 'package:flash_market/screens/reset_password/reset_password_screen.dart';
import 'package:flash_market/screens/signup/signup_screen.dart';
import 'package:flash_market/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/custom_form_input_field.dart';
import '../../../components/form_error.dart';
import '../../../constrains/constants.dart';
import '../../../helper/keyboard.dart';
import '../../otp/components/body.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

bool _isObscure = false;

class _SignInFormState extends State<SignInForm> {
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();
  FocusNode button = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 52, left: 15, right: 15, bottom: 15),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                CustomFormInputField(
                  label: 'Email or Mobile Number',
                  isAsterisk: true,
                  textFormField: emailInputFormField(),
                ),

                // customFormInputField('Email or Mobile Number',
                //     'i.e abc@mail.com', false, TextInputType.text, true),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                CustomFormInputField(
                  label: 'Password',
                  isAsterisk: true,
                  textFormField: passInputFormField(),
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
                FormError(errors: errors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                FullWidthButton(
                  title: 'Login',
                  textSize: 28,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // if all are valid then go to success screen
                      KeyboardUtil.hideKeyboard(context);
                    }
                  },
                ),
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
                        Navigator.pushReplacementNamed(
                            context, SignupScreen.routeName);
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

  TextFormField passInputFormField() {
    return TextFormField(
      focusNode: pass,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          return;
        } else if (value.length >= 8) {
          return;
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (value.length < 8) {
          return "Password is too short";
        }
        return null;
      },
      // textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 20, height: 1.2),
      keyboardType: TextInputType.text,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "Enter Password",
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
    );
  }

  TextFormField emailInputFormField(){
    return TextFormField(
      onSaved: (newValue) {
        username = newValue;
        },
      onFieldSubmitted: (value){
        email.unfocus();
        FocusScope.of(context).requestFocus(pass);
      },
      focusNode: email,
      onChanged: (value) {
        if (value.isNotEmpty) {
          return;
        } else if (emailValidatorRegExp.hasMatch(value)) {
          return;
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        height: 1.2,
        fontSize: 20,
      ),
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: const InputDecoration(
        hintText: "i.e abc@mail.com",
      ),
    );
  }


}
