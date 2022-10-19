import 'package:flash_market/constrains/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constrains/menu_state.dart';
import '../screens/home/home_screen.dart';
import '../screens/change_password/change_password_screen.dart';
import '../screens/onboard/onboard_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.selectedMenu})
      : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: const  Border(
          top: BorderSide(width: 1.0, color: Colors.grey)
        ),
        color: kSecondaryColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: MenuState.home == selectedMenu
                  ? SvgPicture.asset(
                      "assets/icons/home_active.svg",
                    )
                  : SvgPicture.asset(
                      "assets/icons/home.svg",
                    ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
                icon: MenuState.nearMe == selectedMenu
                    ? SvgPicture.asset(
                        "assets/icons/location_active.svg",
                      )
                    : SvgPicture.asset(
                        "assets/icons/location.svg",
                      ),
                onPressed: () {}),
            IconButton(
                icon: MenuState.shop == selectedMenu
                    ? SvgPicture.asset(
                        "assets/icons/shop_active.svg",
                      )
                    : SvgPicture.asset(
                        "assets/icons/shop.svg",
                      ),
                onPressed: () {}),
            IconButton(
              icon: MenuState.notification == selectedMenu
                  ? SvgPicture.asset(
                      "assets/icons/bell_active.svg",
                    )
                  : SvgPicture.asset(
                      "assets/icons/bell.svg",
                    ),
              onPressed: () async {
                // print('Resetting Shared Preference value');
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isFirstTime', false);
                // print(prefs.getBool('isFirstTime'));
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const OnboardScreen()));
              },
            ),
            IconButton(
              icon: MenuState.profile == selectedMenu
                  ? SvgPicture.asset(
                      "assets/icons/account_active.svg",
                    )
                  : SvgPicture.asset(
                      "assets/icons/account.svg",
                    ),
              onPressed: () =>
                  Navigator.pushNamed(context, ChangePasswordScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
