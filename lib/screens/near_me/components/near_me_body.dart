import 'package:flash_market/screens/near_me/components/body.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import '../../../components/custom_bottom_navigaton_bar.dart';
import '../../../components/custom_widgets.dart';
import '../../../constrains/menu_state.dart';

class NearMeBody extends StatelessWidget {
  const NearMeBody({Key? key}) : super(key: key);

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
        body: const Body(),
        bottomNavigationBar: const CustomBottomNavigationBar(selectedMenu: MenuState.nearMe,),
      ),

    );
  }
}
