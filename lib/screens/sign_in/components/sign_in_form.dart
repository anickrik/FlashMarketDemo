import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/full_width_button.dart';
import '../../../components/header_title.dart';
import '../../../model/login/login_model.dart';
import '../../home/home_screen.dart';
import '../../reset_password/reset_password_screen.dart';
import '../../signup/signup_screen.dart';
import '../../../size_config.dart';
import '../../../components/custom_form_input_field.dart';
import '../../../constrains/constants.dart';
import '../../../helper/keyboard.dart';
import '../../../provider/auth.dart';
import '../../otp/components/body.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

bool _isObscure = false;
LoginModel loginModel = LoginModel();


class _SignInFormState extends State<SignInForm> {
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();
  FocusNode button = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? username;
  String? password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    email.unfocus();
    pass.unfocus();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // if all are valid then go to success screen
      KeyboardUtil.hideKeyboard(context);
    }

    buildShowDialog(context);

    await Provider.of<Auth>(context, listen: false)
        .logIn(username!.trim(), password!.trim());
    print(loginModel.status);

    // if(loginModel.status == '200'){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    // }
    // else {
    //   showAlertDialog(context, loginModel.message as String);
    // }
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
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(13),
                      ),
                      SvgPicture.asset(downArrow),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomFormInputField(
                        label: 'Mobile Number',
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
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //         value: !_isObscure,
                      //         onChanged: (_) {
                      //           setState(() {
                      //             _isObscure = !_isObscure;
                      //           });
                      //         }),
                      //     const Text("Show password"),
                      //   ],
                      // ),
                      // FormError(errors: errors),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      FullWidthButton(
                          title: 'Login', textSize: 28, onPress: _submit),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ResetPasswordScreen.routeName);
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
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
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

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  showAlertDialog(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Okay"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Invalid"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextFormField emailInputFormField() {
    return TextFormField(
      controller: _emailController,
      onSaved: (newValue) {
        username = newValue;
      },
      onFieldSubmitted: (value) {
        email.unfocus();
        FocusScope.of(context).requestFocus(pass);
      },
      focusNode: email,
      onChanged: (value) {
        if (value.isNotEmpty) {
          return;
        } else if (emailValidatorRegExp.hasMatch(value) || value.length == 10) {
          return;
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        } else if (/*!emailValidatorRegExp.hasMatch(value) ||*/ value.length <
            10) {
          return kPhoneNumberLen;
        }
        return null;
      },
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(
        height: 1.2,
        fontSize: 20,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)
      ],
      keyboardType: TextInputType.number,
      obscureText: false,
      decoration: const InputDecoration(
        hintText: "9898989898",
      ),
    );
  }

  TextFormField passInputFormField() {
    return TextFormField(
      focusNode: pass,
      controller: _passwordController,
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
      keyboardType: TextInputType.visiblePassword,
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
}
