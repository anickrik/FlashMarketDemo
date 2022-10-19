import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/full_width_button.dart';
import '../../../components/header_subtitle.dart';
import '../../../components/header_title.dart';
import '../../../constrains/constants.dart';
import '../../../size_config.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

String logo = "assets/icons/small_fm_2.svg";
String downArrow = "assets/icons/hr.svg";
bool _isObscure = false;

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeConfig.screenHeight-50,
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(70),
                  ),
                  const HeaderTitle(title: "Change Password"),
                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  const HeaderSubtitle(subtitle: "Your new password must be different from your previous password."),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  SvgPicture.asset(downArrow),
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
                                text: 'Enter Current Password',
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
                            )
                        ),
                        SizedBox(
                          height: defaultInputFieldHeight,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a Password';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 18
                            ),
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
                                text: 'Enter New Password',
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
                            )
                        ),
                        SizedBox(
                          height: defaultInputFieldHeight,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a Password';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 18
                            ),
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
                                text: 'Re-Enter New Password',
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
                            )
                        ),
                        SizedBox(
                          height: defaultInputFieldHeight,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a Password';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 18
                            ),
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
                    height: getProportionateScreenHeight(20),
                  ),
                  FullWidthButton(onPress: (){}, title: "Confirm", textSize: 22,)
                ],
              ),
            ),
          ),
        ));
  }
}
