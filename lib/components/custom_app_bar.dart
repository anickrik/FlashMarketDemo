
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final Widget leftIconButton;
  final Widget rightIconButton;
  final bool showLeftIconButton;
  final bool showRightIconButton;

  const CustomAppBar({
    Key? key,
    required this.leftIconButton,
    required this.rightIconButton,
    required this.showLeftIconButton,
    required this.showRightIconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logo = "assets/icons/small_fm_2.svg";
    // return AppBar(
    //   backgroundColor: kSecondaryColor,
    //   leading: showLeftIconButton ? leftIconButton : const SizedBox(),
    //   title: SvgPicture.asset(logo),
    // actions: [
    // showRightIconButton ? rightIconButton : const SizedBox(),
    // ],
    // );
    return Container(
      // height: SizeConfig.screenHeight * .07,
      // width: SizeConfig.screenWidth,
      padding: const EdgeInsets.only(left: 7.0, right: 7.0,  top: 6.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          showLeftIconButton ? leftIconButton : const Spacer(),
          const Spacer(),
         SvgPicture.asset(logo),
          const Spacer(),
          showRightIconButton ? rightIconButton : const Spacer(),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
