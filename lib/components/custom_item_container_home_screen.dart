import 'package:flash_market/components/view_all_button.dart';
import 'package:flutter/material.dart';


import 'label_title.dart';

class CustomItemContainerHomeScreen extends StatelessWidget {
  final String containerTitle;
  final Color containerTitleColor;
  final Color containerBgColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final double containerHeight;
  final Widget childWidget;

  const CustomItemContainerHomeScreen({Key? key, required this.containerTitle, required this.containerTitleColor, required this.containerBgColor, required this.buttonColor, required this.buttonTextColor, required this.childWidget, required this.containerHeight, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      //defalt height should be 460
      height: containerHeight + 10,
      width: double.infinity,
      color: containerBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14,top: 24, right: 10, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelTitle(title: containerTitle, textColor: containerTitleColor),
                ViewAllButton(text: "View All", textColor: buttonTextColor ,buttonColor: buttonColor,),
              ],
            ),
          ),
          SizedBox(
            height: containerHeight - 60,
            width: double.infinity,
            child: childWidget
          ),
        ],
      ),
    );
  }
}
