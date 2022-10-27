import 'package:flutter/material.dart';

import '../../../components/label_title.dart';
import '../../../components/view_all_button.dart';
import '../../../constrains/constants.dart';
import '../../../model/flash_market_model.dart';
import 'near_me_item_card.dart';

class NearMeDeals extends StatelessWidget {
  final List<NearmeDeal> nearMeDeals;

  const NearMeDeals({Key? key, required this.nearMeDeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrayColor,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 14, top: 24, right: 10, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelTitle(title: "All Near Me", textColor: Colors.black),
                ViewAllButton(
                  text: "View All",
                  textColor: Colors.white,
                  buttonColor: kPrimaryColor,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: nearMeDeals.length,
            itemBuilder: (context, index) => NearMeItemCard(
              saleImage: nearMeDeals[index].saleImage as String,
              saleTitle: nearMeDeals[index].saleTitle as String,
              oldPrice: nearMeDeals[index].oldPrice as String,
              price: nearMeDeals[index].price as String,
              pricePercent: nearMeDeals[index].pricePercent as String,
              merchantLogo: nearMeDeals[index].merchantLogo as String,
              merchantName: nearMeDeals[index].merchantName as String,
              distance: nearMeDeals[index].distance as String,
            ),
          ),
        ],
      ),
    );
  }
}
