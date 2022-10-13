import 'package:flash_market/screens/change_password/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/custom_form_input_field.dart';
import '../../../components/full_width_button.dart';
import '../../../components/header_subtitle.dart';
import '../../../components/header_title.dart';
import '../../../size_config.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

String logo = "assets/icons/small_fm_2.svg";
String downArrow = "assets/icons/hr.svg";

class _ResetPasswordFormState extends State<ResetPasswordForm> {
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
                  const HeaderTitle(title: "Reset Password"),
                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  const HeaderSubtitle(subtitle: "Enter the email or mobile number associated with your account and we'll send a link to reset your password."),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  SvgPicture.asset(downArrow),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  customFormInputField("Email or Mobile Number", "i.e abc@mail.com", false, TextInputType.text, true),
                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  FullWidthButton(onPress: (){
                    Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                  }, title: "Send Recovery Email", textSize: 22,)
                ],
              ),
            ),
          ),
        ));
  }
}
