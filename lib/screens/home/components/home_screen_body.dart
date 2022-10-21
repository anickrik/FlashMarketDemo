import 'package:flash_market/components/custom_bottom_navigaton_bar.dart';
import 'package:flash_market/components/custom_widgets.dart';
import 'package:flash_market/constrains/menu_state.dart';
import 'package:flash_market/screens/home/components/body.dart';

import 'package:flutter/material.dart';
import '../../../components/custom_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leftIconButton: locationIconButton(context),
          rightIconButton: cartIconButton(context),
          showRightIconButton: true,
          showLeftIconButton: true,
        ),
        body: const Body(),/*Stack(
              alignment: Alignment.topCenter,
              children: [
                const Body(),
                CustomAppBar(
                      leftIconButton: locationIconButton(context),
                      rightIconButton: cartIconButton(context),
                      showRightIconButton: true,
                      showLeftIconButton: true,
                  ),
              ],
            ),*/
        bottomNavigationBar: const CustomBottomNavigationBar(selectedMenu: MenuState.home,),
      ),

    );
  }
}
