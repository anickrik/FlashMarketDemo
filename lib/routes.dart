
import 'package:flash_market/screens/change_password/change_password_screen.dart';
import 'package:flash_market/screens/home/home_screen.dart';
import 'package:flash_market/screens/onboard/onboard_screen.dart';
import 'package:flash_market/screens/otp/otp_screen.dart';
import 'package:flash_market/screens/reset_password/reset_password_screen.dart';
import 'package:flash_market/screens/sign_in//sign_in_screen.dart';
import 'package:flash_market/screens/signup/signup_screen.dart';
import 'package:flash_market/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName: (context) => const SplashScreen(),
  OnboardScreen.routeName : (context) => const OnboardScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
  ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),

};