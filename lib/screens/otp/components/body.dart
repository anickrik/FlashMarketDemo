import 'dart:async';

import 'package:flash_market/components/full_width_button.dart';
import 'package:flash_market/components/header_subtitle.dart';
import 'package:flash_market/components/header_title.dart';
import 'package:flash_market/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

String logo = "assets/icons/small_fm_2.svg";
String downArrow = "assets/icons/hr.svg";
bool isDataEntered = false;
bool resendOtpButtonEnable = false;

Widget otpField(BorderRadius borderRadius, FocusNode? focusNode,
    FocusNode? nextFocusNode, TextEditingController controller) {
  return Container(
    height: getProportionateScreenHeight(50),
    margin: const EdgeInsets.all(6),
    width: getProportionateScreenWidth(70),
    child: TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1)
      ],
      controller: controller,
      focusNode: focusNode,
      onChanged: (value) => nextField(value, nextFocusNode),
      textAlignVertical: TextAlignVertical.top,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: borderRadius),
      ),
    ),
  );
}

Widget buildTimer(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 00.0),
        duration: const Duration(seconds: 30),
        builder: (_, dynamic value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ),
      ),
    ],
  );
}

void nextField(String value, FocusNode? focusNode) {
  if (value.length == 1) {
    focusNode!.requestFocus();
  }
}

class _BodyState extends State<Body> {
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  final textController_1 = TextEditingController();
  final textController_2 = TextEditingController();
  final textController_3 = TextEditingController();
  final textController_4 = TextEditingController();

  checkTextFieldEmptyOrNot() {
    String text1, text2, text3, text4;
    text1 = textController_1.text;
    text2 = textController_2.text;
    text3 = textController_3.text;
    text4 = textController_4.text;

    if (text1 == '' || text2 == '' || text3 == '' || text4 == '') {
      setState(() {
        isDataEntered = false;
      });
      // Put your code here which you want to execute when Text Field is Empty.
    } else {
      setState(() {
        isDataEntered = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  int _counter = 30;
  late Timer _timer;

  void startTimer() {
    _counter = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
        setState(() {
          resendOtpButtonEnable = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.screenHeight - 53,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(logo),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(26),
                ),
                const HeaderTitle(title: "Verify Mobile Number"),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                const HeaderSubtitle(subtitle: "A verification code has been sent to your mobile number. Please enter the code below."),
                SizedBox(
                  height: getProportionateScreenHeight(13),
                ),
                SvgPicture.asset(downArrow),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 26, bottom: 10),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Enter OTP (One Time Password)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        otpField(
                          const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          pin1FocusNode,
                          pin2FocusNode,
                          textController_1,
                        ),
                        otpField(const BorderRadius.only(), pin2FocusNode,
                            pin3FocusNode!, textController_2),
                        otpField(const BorderRadius.only(), pin3FocusNode,
                            pin4FocusNode!, textController_3),
                        Container(
                          height: getProportionateScreenHeight(50),
                          margin: const EdgeInsets.all(6),
                          width: getProportionateScreenWidth(70),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            controller: textController_4,
                            focusNode: pin4FocusNode,
                            onChanged: (value) {
                              if (value.length == 1) {
                                pin4FocusNode!.unfocus();
                                checkTextFieldEmptyOrNot();
                              }
                            },
                            textAlignVertical: TextAlignVertical.top,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: isDataEntered
                      ? FullWidthButton(
                          onPress: () {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const HomeScreen()));
                          },
                          title: "Verify", textSize: 28,

                        )
                      : const FullWidthButton(
                          onPress: null,
                          title: "Verify",
                    textSize: 28,
                        ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),

                Text(
                  "00:${_counter.toString().padLeft(2, '0')}",
                  //pad left used for adding extra leading digit
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18),
                ),
                // buildTimer(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Haven't received your code?",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: (resendOtpButtonEnable) ? () {} : null,
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                            color: (resendOtpButtonEnable)
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                //const Spacer(),
                //here we can also paste Bottom Footer code.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
