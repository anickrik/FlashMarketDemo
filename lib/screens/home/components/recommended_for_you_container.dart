import 'package:flash_market/screens/home/components/item_card.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_item_container_home_screen.dart';
import '../../../constrains/constants.dart';
import '../../../model/flash_market_model.dart';
import '../../../size_config.dart';

class RecommendedForYouContainer extends StatelessWidget {
  final List<RecentVisitedDeals> recentVisitedDeals;
  const RecommendedForYouContainer({Key? key, required this.recentVisitedDeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recentVisitedDeals.isNotEmpty ?
      CustomItemContainerHomeScreen(
      containerTitle: "Recommended for you",
      containerTitleColor: Colors.black,
      containerBgColor: kGrayColor,
      buttonColor: kPrimaryColor,
      buttonTextColor: Colors.white,
      containerHeight: getProportionateScreenHeight(450),
      childWidget: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recentVisitedDeals.length,
        itemBuilder: (context, index) =>
            ItemCard(
              showFlashHours: false,
              saleImage: recentVisitedDeals[index].saleImage as String,
              saleTitle: recentVisitedDeals[index].saleTitle as String,
              price: recentVisitedDeals[index].price as String,
              oldPrice: recentVisitedDeals[index].oldPrice as String,
              pricePercentage: recentVisitedDeals[index].pricePercent as String,
              timeRemaining: recentVisitedDeals[index].timeRemaining as String,
              merchantName: recentVisitedDeals[index].merchantName as String,
              merchantLogo: recentVisitedDeals[index].merchantLogo as String,
              distance: recentVisitedDeals[index].distance as String,
            ),
      ),
    ) : Container();
  }
}
