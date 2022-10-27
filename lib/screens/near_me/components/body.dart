import 'package:flash_market/components/custom_item_container_home_screen.dart';
import 'package:flash_market/constrains/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/home/flash_market_model.dart';
import '../../../provider/auth.dart';
import '../../../size_config.dart';
import '../../home/components/featured_business_item_card.dart';
import '../../home/components/item_card.dart';
import '../../home/components/near_me_deals.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Future<FlashMarketModel> getHomeScreenData =
        Provider.of<Auth>(context, listen: false).fetchDataFromServer();

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: FutureBuilder<FlashMarketModel>(
        future: getHomeScreenData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomItemContainerHomeScreen(
                      containerTitle: 'Featured Listing Near You',
                      containerTitleColor: Colors.black,
                      containerBgColor: kGrayColor,
                      buttonColor: kPrimaryColor,
                      buttonTextColor: Colors.white,
                      containerHeight: getProportionateScreenHeight(480),
                      childWidget: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.result?.featuredDeals?.length,
                        itemBuilder: (context, index) => ItemCard(
                          showFlashHours: true,
                          saleImage: snapshot.data!.result
                              ?.featuredDeals?[index].saleImage as String,
                          saleTitle: snapshot.data!.result
                              ?.featuredDeals?[index].saleTitle as String,
                          price: snapshot.data!.result?.featuredDeals?[index]
                              .price as String,
                          oldPrice: snapshot.data!.result?.featuredDeals?[index]
                              .oldPrice as String,
                          pricePercentage: snapshot.data!.result
                              ?.featuredDeals?[index].pricePercent as String,
                          timeRemaining: snapshot.data!.result
                              ?.featuredDeals?[index].timeRemaining as String,
                          merchantName: snapshot.data!.result
                              ?.featuredDeals?[index].merchantName as String,
                          merchantLogo: snapshot.data!.result
                              ?.featuredDeals?[index].merchantLogo as String,
                          distance: snapshot.data!.result?.featuredDeals?[index]
                              .distance as String,
                        ),
                      ),
                    ),
                    CustomItemContainerHomeScreen(
                      containerTitle: "Local Business",
                      containerTitleColor: Colors.white,
                      containerBgColor: kPrimaryColor,
                      buttonColor: Colors.white,
                      buttonTextColor: kPrimaryColor,
                      containerHeight: getProportionateScreenHeight(390),
                      childWidget: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.result?.localBusiness?.length,
                        itemBuilder: (context, index) =>
                            FeaturedBusinessItemCard(
                          merchantBannerImage: snapshot
                              .data!
                              .result
                              ?.localBusiness?[index]
                              .merchantBannerImage as String,
                          merchantLogo: snapshot.data!.result
                              ?.localBusiness?[index].merchantLogo as String,
                          companyName: snapshot.data!.result
                              ?.localBusiness?[index].companyName as String,
                          aboutMerchant: snapshot.data!.result
                              ?.localBusiness?[index].aboutMerchant as String,
                          distance: snapshot.data!.result?.localBusiness?[index]
                              .distance as String,
                          suburb: snapshot.data!.result?.localBusiness?[index]
                              .suburb as String,
                        ),
                      ),
                    ),
                    NearMeDeals(
                        nearMeDeals: snapshot.data?.result?.nearmeDeal
                            as List<NearmeDeal>),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
